//
//  Shelf.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import Foundation
import SwiftUI

struct ShelfModel: Decodable {
    let uid         : String
    let UUID        : String
    let major       : String
    let minor       : String
    let name        : String
    let image       : String
    let nearbyUsers : [UserBrief]
    let sizes       : [MalePantSize] //Alter if the size is not Length/Waist (pants only)
}


struct ShelfBrief: Identifiable {
    var id: UUID
    let uid: String
    let image: UIImage
}

//Create more types of sizes and conditionally alter ShelfModel sizes
struct MalePantSize: Decodable {
    let length: String
    let waist: String
}


