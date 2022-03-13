//
//  Iterable_SA_ChallengeApp.swift
//  Iterable-SA-Challenge
//
//  Created by Michael Schmitt on 3/12/22.
//

import SwiftUI
import IterableSDK

@main
struct Iterable_SA_ChallengeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let config = IterableConfig()
        
        IterableAPI.initialize(apiKey: "349dcc9373c74c6699c5d1204a271695", launchOptions: launchOptions, config: config)
        IterableAPI.email = "mike@holy-schmitt.dev"
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        IterableAppIntegration.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
}
