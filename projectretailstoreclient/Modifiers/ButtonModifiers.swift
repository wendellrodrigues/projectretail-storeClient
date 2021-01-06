//
//  ButtonModifiers.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import Foundation
import SwiftUI


struct LargeButtonModifier: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("DMSans-Bold", size: 18))
            .foregroundColor(Color("Button_Text"))
            .frame(width: 350, height: 70, alignment: .center)
            .background(Color("Button_Background").opacity(configuration.isPressed ? 0.8 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}


