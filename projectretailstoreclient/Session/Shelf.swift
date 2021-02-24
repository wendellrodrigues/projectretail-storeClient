//
//  Shelf.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import Foundation
import Combine
import SwiftUI

class Shelf: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Shelf,Never>()

    @Published var shelf:
        ShelfModel = ShelfModel(uid: "", UUID: "", major: "", minor: "", name: "", image: "", price: 0, attributes: [], color: "", type: "", gender: "", description: "", nearbyUsers: [], sizes: []) {
       // ShelfModel = ShelfModel(uid: "", UUID: "", major: "", minor: "", name: "", image: "", nearbyUsers: [], sizes: []) {
        didSet { objectWillChange.send(self) }
    }
}
