//
//  Modifiers.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import Foundation
import SwiftUI

let threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
let twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
let oneColumnGrid = [GridItem(.flexible())]

//Modifier for Grid
struct NearbyUsersGridModifier: ViewModifier {
    
    let screen = UIScreen.main.bounds

    func body(content: Content) -> some View {
        content
            .frame(width: screen.width - 300, height: 250)
    }
}
