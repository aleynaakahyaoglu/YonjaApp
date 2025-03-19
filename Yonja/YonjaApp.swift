//
//  YonjaApp.swift
//  Yonja
//
//  Created by Aleyna on 18.03.2025.
//

import SwiftUI
import Firebase

@main
struct YonjaApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
