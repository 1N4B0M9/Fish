//
//  FishApp.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 1/18/23.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct FishApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userInfo : UserInfo = UserInfo()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfo)

        }
    }
}
