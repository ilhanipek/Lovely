import Foundation

struct UserModel: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
    }
} 