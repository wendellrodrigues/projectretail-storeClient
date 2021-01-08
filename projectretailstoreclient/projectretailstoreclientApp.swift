//
//  projectretailstoreclientApp.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 11/10/20.
//

import SwiftUI
import Firebase

@main

struct projectretailstoreclientApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Home().environmentObject(NearbyUsers())
        }
    }
}
