//
//  CheckThisOutApp.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

//import SwiftUI
//import Firebase
//
//@main
//struct CheckThisOutApp: App {
//
//    init() {
//        FirebaseApp.configure()
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(AuthViewModel.shared)
//        }
//    }
//}

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
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
              .environmentObject(AuthViewModel.shared)
              .navigationBarTitle("")
              .navigationBarHidden(true)
      }
    }
  }
}
