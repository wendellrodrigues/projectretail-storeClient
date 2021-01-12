//
//  Constants.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import Foundation
import Firebase
import FirebaseStorage



let REQUEST_URL = "192.168.1.66"

let BEGIN_BUTTON = "Begin"
let WELCOME_MSG_TITLE = "Welcome"
let WELCOME_MSG_SUB = ""
let SELECT_NAME_TITLE = "Begin"
let SELECT_NAME_INSTRUCTIONS = "Select your name below"

//Static beacon ID (for this iPad only, in future handle with login)
let BEACON_ID = "7777772E-6B6B-6D63-6E2E-636F6D000001"
let BEACON_MAJOR = "3838"
let BEACON_MINOR = "4949"

let IMAGE_URL = "gs://projectretail-4dd60.appspot.com/khakis.png"

//Firebase
class Ref {
    
    static var FIRESTORE_ROOT = Firestore.firestore()
    
    let storage = Storage.storage()
    
    //Firestore Users
    static var FIRESTORE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
    
    //Firestore stores
    static var FIRESTORE_COLLECTION_STORES = FIRESTORE_ROOT.collection("stores")
    
    //Firestore beacons
    static var FIRESTORE_COLLECTION_BEACONS = FIRESTORE_ROOT.collection("beacons")
}


