import SwiftUI
import SwiftData

@main
struct NutriLogApp: App {
    @StateObject var auth = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(PersistenceController.shared.container).environmentObject(auth)
    }
}
