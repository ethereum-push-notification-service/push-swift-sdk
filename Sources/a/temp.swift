// func aesGCMDecrypt(ciphertext: Data, tag: Data, key: SymmetricKey, nonce: Data) throws -> Data {
//   let sealedBox = try AES.GCM.SealedBox.init(
//     nonce: AES.GCM.Nonce(data: nonce), ciphertext: ciphertext, tag: tag)
//   let decryptedData = try AES.GCM.open(sealedBox, using: key)
//   return decryptedData
// }

// func aesGCMEncrypt(plaintext: Data, key: SymmetricKey, nonce: Data) throws -> (Data, Data) {
//   let sealedBox = try AES.GCM.seal(
//     plaintext, using: key, nonce: AES.GCM.Nonce(data: nonce))
//   return (sealedBox.ciphertext, sealedBox.tag)
// }

// func deriveKey(key: String, salt: String) -> SymmetricKey {
//   let key: SymmetricKey = SymmetricKey(data: key.data(using: .utf8)!)
//   let salt = salt.data(using: .utf8)!
//   let derivedKey = HKDF<SHA256>.deriveKey(inputKeyMaterial: key, salt: salt, outputByteCount: 256)
//   return derivedKey
// }

// func simpleTest() throws {
//   let ck = "my-256-bit-secret-my-secret-my-s"
//   let _nonce = hexToData(characters: "dfc04cc878288")
//   let ckkey = SymmetricKey(data: ck.data(using: .utf8)!)

//   let chyper = "This is a good place to find a city"
//   let (ciphertext, tag) = try aesGCMEncrypt(
//     plaintext: chyper.data(using: .utf8)!, key: ckkey, nonce: _nonce)

//   print("Enc data ->", ciphertext.base64EncodedString(), "tag", tag.base64EncodedString())

//   let res = try aesGCMDecrypt(ciphertext: ciphertext, tag: tag, key: ckkey, nonce: _nonce)
//   print("Dec data ->", String(data: res, encoding: .utf8)!)

// }
