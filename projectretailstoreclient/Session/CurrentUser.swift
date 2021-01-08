//
//  CurrentUser.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import Foundation


import Foundation
import Combine
import SwiftUI

class CurrentUser: ObservableObject {
    
    let objectWillChange = PassthroughSubject<CurrentUser,Never>()

    //The current user
    @Published var user:
        User = User(uid: "", firstName: "", email: "", hasEnteredSizingPreferences: false, femalePantsSize: "", femaleShirtSize: "", maleShirtSize: "", maleLengthSize: 0, maleWaistSize: 0, styles: []) {
        didSet { objectWillChange.send(self) }
    }
    
    //Change if there is a current user
    @Published var isCurUser: Bool = false {
        didSet { objectWillChange.send(self) }
    }
}
