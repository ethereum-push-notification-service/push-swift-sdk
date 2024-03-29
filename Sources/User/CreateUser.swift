import ObjectivePGP

extension PushUser {

  public enum ProgressLevel {
    case INFO
    case SUCCESS
    case WARN
    case ERROR
  }

  public struct ProgressHookType {
    public var progressId: String
    public var progressTitle: String
    public var progressInfo: String
    public var level: ProgressLevel
  }

  private struct CreateUserHashData: Encodable {
    var caip10: String
    var did: String
    var publicKey: String
    var encryptedPrivateKey: String

    public func getJSONString() throws -> String {
      return try getJsonStringFromKV([
        ("caip10", self.caip10),
        ("did", self.did),
        ("publicKey", self.publicKey),
        ("encryptedPrivateKey", self.encryptedPrivateKey),
      ])
    }
  }

  private struct CreateUserAPIOptions: Encodable {
    var caip10: String
    var did: String
    var publicKey: String
    var encryptedPrivateKey: String
    var encryptionType: String?
    var name: String?
    var encryptedPassword: String?
    var verificationProof: String?
    var signature: String?
    var sigType: String?
  }

  public struct CreateUserOptions {
    var env: ENV = ENV.STAGING
    var signer: Signer
    var version: ENCRYPTION_TYPE = ENCRYPTION_TYPE.PGP_V3
    var progressHook: ((ProgressHookType) -> Void)?

    public init(
      env: ENV = ENV.STAGING,
      signer: Signer,
      version: ENCRYPTION_TYPE = ENCRYPTION_TYPE.PGP_V3,
      progressHook: ((ProgressHookType) -> Void)?
    ) {
      self.env = env
      self.signer = signer
      self.version = version
      self.progressHook = progressHook
    }
  }

  public static func create(options: CreateUserOptions) async throws -> PushUser {
    do {
      let wallet = try await Wallet(signer: options.signer)
      let address = wallet.account

      if !isValidETHAddress(address: address) {
        throw UserError.INVALID_ETH_ADDRESS
      }
      let caip10 = walletToPCAIP10(account: address)

      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-CREATE-01",
          progressTitle: "Generating Secure Profile Signature",
          progressInfo:
            "This step is only done for first time users and might take a few seconds. PGP keys are getting generated to provide you with secure yet seamless chat",
          level: ProgressLevel.INFO
        ))

      let keyPairs = try Pgp.GenerateNewPgpPair()

      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-CREATE-02",
          progressTitle: "Signing Generated Profile",
          progressInfo:
            "This step is only done for first time users. Please sign the message to continue.",
          level: ProgressLevel.INFO
        ))

      let publicKey = try await keyPairs.preparePGPPublicKey(signer: wallet.signer)

      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-CREATE-03",
          progressTitle: "Encrypting Generated Profile",
          progressInfo: "Encrypting your keys. Please sign the message to continue.",
          level: ProgressLevel.INFO
        ))

      let encryptedPrivateKey: EncryptedPrivateKeyV2 = try await keyPairs.encryptPGPKey(
        wallet: wallet)

      let encryptedPrivateKeyString = try encryptedPrivateKey.getJSONString()

      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-CREATE-04",
          progressTitle: "Syncing Generated Profile",
          progressInfo: "Please sign the message to continue. Steady lads, chat is almost ready!",
          level: ProgressLevel.INFO
        ))

      let apiDataString = try CreateUserHashData(
        caip10: walletToPCAIP10(account: caip10),
        did: walletToPCAIP10(account: caip10),
        publicKey: publicKey,
        encryptedPrivateKey: encryptedPrivateKeyString
      ).getJSONString()

      let hash = generateSHA256Hash(
        msg:
          apiDataString
      )

      let verificationProof = try await wallet.getEip191Signature(message: hash, version: "v2")

      let updatedData = CreateUserAPIOptions(
        caip10: walletToPCAIP10(account: caip10),
        did: walletToPCAIP10(account: caip10),
        publicKey: publicKey,
        encryptedPrivateKey: encryptedPrivateKeyString,
        encryptionType: ENCRYPTION_TYPE.PGP_V3.stringValue,
        name: "",
        signature: verificationProof,
        sigType: "a"
      )

      let url: URL = PushEndpoint.createUser(env: options.env).url
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpBody = try JSONEncoder().encode(updatedData)

      let (data, res) = try await URLSession.shared.data(for: request)

      guard let httpResponse = res as? HTTPURLResponse else {
        throw URLError(.badServerResponse)
      }

      guard (200...299).contains(httpResponse.statusCode) else {
        print(try data.toString())
        throw URLError(.badServerResponse)
      }

      // orut
      let createdUser = try JSONDecoder().decode(PushUser.self, from: data)

      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-CREATE-05",
          progressTitle: "Setup Complete",
          progressInfo: "",
          level: ProgressLevel.SUCCESS
        ))

      return createdUser

    } catch {
      options.progressHook?(
        ProgressHookType(
          progressId: "PUSH-ERROR-00",
          progressTitle: "Non Specific Error",
          progressInfo: "[Push SDK] - API  - Error - API create User() -: \(error)",
          level: ProgressLevel.ERROR
        ))
      throw UserError.RUNTIME_ERROR("[Push SDK] - API  - Error - API create User() -: \(error)")
    }
  }

  public static func createUserEmpty(userAddress: String, env: ENV) async throws -> PushUser {
    let caip10 = walletToPCAIP10(account: userAddress)

    let updatedData = CreateUserAPIOptions(
      caip10: caip10,
      did: caip10,
      publicKey: "",
      encryptedPrivateKey: "",
      encryptionType: "",
      name: "",
      signature: "pgp",
      sigType: "pgp"
    )

    let url: URL = PushEndpoint.createUser(env: env).url
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try JSONEncoder().encode(updatedData)

    let (data, res) = try await URLSession.shared.data(for: request)

    guard let httpResponse = res as? HTTPURLResponse else {
      throw URLError(.badServerResponse)
    }

    guard (200...299).contains(httpResponse.statusCode) else {
      throw URLError(.badServerResponse)
    }

    // orut
    let createdUser = try JSONDecoder().decode(PushUser.self, from: data)
    return createdUser
  }
}
