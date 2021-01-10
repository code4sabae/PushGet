//
//  PushGetApp.swift
//  PushGet
//
//  Created by Taisuke Fukuno on 2021/01/10.
//

import SwiftUI

@main
struct PushGetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    @ObservedObject var userdata = UserData.shared
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // MARK: 02. request to user
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard granted else { return }

            // MARK: 03. register to APNs
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        return true
    }
    // MARK: 04-1. succeeded to register to APNs
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Data -> Token string
        let tokenBytes = deviceToken.map { (byte: UInt8) in String(format: "%02.2hhx", byte) }
        let token = tokenBytes.joined()
        self.userdata.token = token
        //application.requestSceneSessionRefresh()
        print("Device token: \(token)")
    }

    // MARK: failed to register to APNs
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("Failed to register to APNs: \(error)")
    }
}
