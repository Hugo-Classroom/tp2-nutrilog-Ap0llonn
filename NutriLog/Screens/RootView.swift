import SwiftUI

struct RootView: View {
    // TODO: Cette partie sera vue en classe pour l'expliquer comme il faut
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        if (auth.isAuthenticated) {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
