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
        ShelfModel = ShelfModel(UUID: "", major: "", minor: "", name: "", image: "", nearbyUsers: [], sizes: []) {
        didSet { objectWillChange.send(self) }
    }
}
