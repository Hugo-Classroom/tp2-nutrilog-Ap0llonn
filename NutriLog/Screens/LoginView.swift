import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @EnvironmentObject var auth: AuthViewModel
    var body: some View {
        VStack{
            Image("nutrilog-logo")
            Button{
                authWithFaceID(auth: auth)
            }label: {
                Label("Se connecter", systemImage: "faceid")
            }.padding(8).background(Color("LoginButton"))
                .foregroundColor(.white)
                .cornerRadius(8)
                
        }.frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color("LoginBackground"))
            .ignoresSafeArea()
    }
}

func authWithFaceID(auth: AuthViewModel) {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Connexion à votre compte NutriLog"
        
         context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authError in
            DispatchQueue.main.async {
                if success {
                    
                    auth.isAuthenticated = true;
                }else{
                    print("auth failed")
                }
                
            }
        }
    }else{
        print("face id not accessible")
    }
}

#Preview {
    LoginView()
}


