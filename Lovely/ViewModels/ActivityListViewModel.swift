import Foundation

class ActivityListViewModel: ObservableObject {
    @Published var activities: [ActivityModel] = []
    @Published var selectedCategory: ActivityCategory?
    
    // MARK: - Dependencies
  private let networkService: HTTPClientProtocol

  init(networkService: HTTPClientProtocol) {
        self.networkService = networkService
    }
    
    // MARK: - Methods
    func fetchActivities() async {
        do {
          let activity = ActivityModel(title: "Yemeğe çık", description: "Yemek", category: .blue, createdBy: "Desti")
          DispatchQueue.main.async {
            self.activities = [activity]
          }
        } catch {
            print("Error fetching activities: \(error)")
        }
    }
    
    func filterActivities(by category: ActivityCategory?) {
        selectedCategory = category
    }
    
    var filteredActivities: [ActivityModel] {
        guard let selectedCategory = selectedCategory else {
            return activities
        }
        return activities.filter { $0.category == selectedCategory }
    }
} 
