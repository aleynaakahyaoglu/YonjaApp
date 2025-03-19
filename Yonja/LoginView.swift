//
//  LoginView.swift
//  Yonja
//
//  Created by Aleyna on 18.03.2025.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginMethod = "E-posta"
    @State private var isLoggedIn = false
    
    var body: some View{
        NavigationView{
            VStack{
                HStack{
                    Button(action: { loginWithApple() }) {
                        Text("Apple ile Giriş Yap")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    Button(action: { loginWithGoogle() }) {
                        Text("Google ile Giriş Yap")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    Button(action: { loginWithPhoneNumber() }) {
                        Text("Telefon numarası ile Giriş Yap")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
                
                TextField(loginMethod, text: $email)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                
                SecureField("Şifre", text: $password)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.top, 10)
                
                
                Button(action: {
                    authanticateUser()
                }) {
                    Text("Giriş Yap")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                }
                
                NavigationLink(destination: YonjaView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
    private func loginWithApple() {
        loginMethod = "Apple ID"
    }
    
    private func loginWithGoogle() {
        loginMethod = "Google"
    }
    
    private func loginWithPhoneNumber() {
        loginMethod = "Telefon"
    }
    
    
    private func authanticateUser(){
        guard !email.isEmpty, !password.isEmpty else {
            print("E-posta ve şifre alanlarını doldurun!")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            isLoggedIn = true
            print("Giriş Başarılı")
            
        }
    }
    struct LoginView_Previews: PreviewProvider{
        static var previews: some View {
            LoginView()
        }
    }
}
