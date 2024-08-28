import Foundation

struct DashboardDataModel: Codable {
    var customerDashboard: CustomerDashboard
    var myProfile: MyProfile
    var myNewNotifications: Int
    var code: Int

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customerDashboard = try container.decode(CustomerDashboard.self, forKey: .customerDashboard)
        self.myProfile = try container.decode(MyProfile.self, forKey: .myProfile)
        self.myNewNotifications = try container.decode(Int.self, forKey: .myNewNotifications)
        self.code = try container.decode(Int.self, forKey: .code)
    }

    private enum CodingKeys: String, CodingKey {
        case customerDashboard = "customer_dashboard"
        case myProfile = "my_profile"
        case myNewNotifications = "my_new_notifications"
        case code
    }
}

struct CustomerDashboard: Codable {
    var date: String
    var notifications: NotificationsCount
    var menuItems: [MenuItems]
    var banners: [Banners]
    var services: [Services]
    var navbar: [Navbar]
    
    private enum CodingKeys: String, CodingKey {
        case date, notifications
        case menuItems = "menu_items"
        case banners, services, navbar
    }
}

struct NotificationsCount: Codable {
    var count: Int?
}

struct MenuItems: Codable {
    var action: String
    var name: String
    var description: String
    var arrear: String?
    var amountCoins: Int?
    var expected: Expected?
    
    private enum CodingKeys: String, CodingKey {
        case action, name, description, arrear
        case amountCoins = "amount_coins"
        case expected
    }
}

struct Expected: Codable {
    var lastDate: String?
    var indications: [Indications]?
    
    private enum CodingKeys: String, CodingKey {
        case lastDate = "last_date"
    }
}

struct Indications: Codable {
    var type: String?
    var label: String?
    var lastTransfer: String?
    var expected: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case lastTransfer = "last_transfer"
    }
}

struct Banners: Codable {
    var title: String
    var text: String
    var image: String
    var action: String
    var priority: Int
}

struct Services: Codable {
    var name: String
    var action: String
    var order: Int
}

struct Navbar: Codable {
    var name: String
    var action: String
}

struct MyProfile: Codable {
    var id: String
    var name: String
    var shortName: String
    var firstName: String
    var lastName: String
    var secondName: String
    var email: String
    var phone: String
    var photo: URL
    var property: String
    var address: String
    var rating: Int

    private enum CodingKeys: String, CodingKey {
        case id, name
        case shortName = "short_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case secondName = "second_name"
        case email, phone, photo, property, address, rating
    }
}


