//
//  NearbyUsers.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/5/21.
//

import Foundation
import Combine
import SwiftUI


class NearbyUsers: ObservableObject {
    
    let objectWillChange = PassthroughSubject<NearbyUsers,Never>()
    
    @Published var nearbyUsers: Array = [] {
        didSet {
            objectWillChange.send(self)
        }
    }
    
}
