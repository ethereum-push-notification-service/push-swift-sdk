import Foundation
import SocketIO

public struct PushSockets {
  public static var Events = SocketEvents()

  public static func parseMessage(data: [Any]) throws -> Message? {
    if let datas = data as? [NSDictionary] {
      if datas.count == 0 {
        return nil
      }

      let data = datas.first!
      let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
      let msg = try JSONDecoder().decode(Message.self, from: jsonData)
      
      return msg
    }
    return nil
  }

  public static func getSocketManager(env: ENV, userAddress: String, log: Bool = false) throws
    -> SocketManager
  {
    let host = URL(string: "https://\(ENV.getHost(withEnv: env))")!
    let caipAddress = try addressToCaip10(env: env, address: userAddress)

    let manager = SocketManager(
      socketURL: host,
      config: [
        .log(log), .forceWebsockets(true), .reconnectAttempts(5), .reconnects(true),
        .connectParams(["mode": "chat", "did": caipAddress]
        ),
      ])

    return manager
  }

}

public struct SocketEvents {
  public var CONNECT = "connect"
  public var DISCONNECT = "disconnect"

  // Notification
  public var USER_FEEDS = "userFeeds"
  public var USER_SPAM_FEEDS = "userSpamFeeds"

  // Chat
  public var CHAT_RECEIVED_MESSAGE = "CHATS"
  public var CHAT_GROUPS = "CHAT_GROUPS"
}
