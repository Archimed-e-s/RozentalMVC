import Foundation

struct AuthorizationDataModel: Codable {
    var login: String
    var customerNavbar: [CustomerNavbar]
    var code: Int

    private enum CodingKeys: String, CodingKey {
        case login
        case customerNavbar = "customer_navbar"
        case code
    }
}

struct CustomerNavbar: Codable {
    var name: String
    var action: String
}

