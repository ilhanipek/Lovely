import Foundation

enum ActivityCategory: String, Codable {
    case red
    case blue
    case green

    var description: String {
        switch self {
        case .red:   return "Bütçe dostu ve kolay"
        case .blue:  return "Orta bütçeli/zorlukta"
        case .green: return "Yüksek bütçeli/zorlu"
        }
    }
}

struct ActivityModel: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let category: ActivityCategory
    let createdAt: Date
    let completedAt: Date?
    let createdBy: String
    
    init(id: UUID = UUID(), 
         title: String, 
         description: String, 
         category: ActivityCategory, 
         createdBy: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.createdAt = Date()
        self.completedAt = nil
        self.createdBy = createdBy
    }
} 
