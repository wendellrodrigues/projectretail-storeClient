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
    let price       : Int
    let attributes  : [String]
    let color       : String
    let type        : String
    let gender      : String
    let description : String
    let nearbyUsers : [UserBrief]
    let sizes       : [SizeType]//Alter if the size is not Length/Waist (pants only)
}

//For recently viewed images
struct ShelfBrief: Identifiable {
    var id: UUID
    let uid: String
    let image: UIImage
}

struct SizeType: Decodable {
    let maleLengthSize: Int
    let maleWaistSize: Int
    let maleShirtSize: String
    let femaleShirtSize: String
    let femalePantSize: String
    let shelf: Int
}

//Create more types of sizes and conditionally alter ShelfModel sizes
struct MalePantSize: Decodable {
    let length: Int
    let waist: Int
    let shelf: Int
}

struct MaleShirtSize: Decodable {
    let size: String
    let shelf: Int
}

struct FemalePantSize: Decodable {
    let size: String
    let shelf: Int
}

struct FemaleShirtSize: Decodable {
    let size: String
    let shelf: Int
}



extension String: Identifiable {
    public var id: String { self }
}


