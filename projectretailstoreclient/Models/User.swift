//
//  User.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/7/21.
//

import Foundation


struct User: Decodable {
    let uid                         : String
    let firstName                   : String
    let email                       : String
    let hasEnteredSizingPreferences : Bool
    let femalePantsSize             : String
    let femaleShirtSize             : String
    let maleShirtSize               : String
    let maleLengthSize              : Int
    let maleWaistSize               : Int
    let styles                      : [String]
}

//Brief User Model to be used for name selection (so dont need to load all user data)
struct UserBrief: Decodable, Identifiable {
    let id: String
    let name: String
}
