//
//  SwiftUI_FirebaseLoginApp.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI
import Firebase
import FirebaseCore
@main
struct SwiftUI_FirebaseLoginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
