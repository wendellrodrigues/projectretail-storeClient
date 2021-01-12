//
//  Shelf.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import Foundation

struct ShelfModel: Decodable {
    let uid         : String
    let UUID        : String
    let major       : String
    let minor       : String
    let name        : String
    let image       : String
    let nearbyUsers : [UserBrief]
    let sizes       : [Size] //Alter if the size is not Length/Waist (pants only)
}

struct Size: Decodable {
    let length: String
    let waist: String
}
