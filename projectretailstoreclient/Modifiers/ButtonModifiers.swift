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

struct MediumButtonModifier: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("DMSans-Bold", size: 18))
            .foregroundColor(Color("Button_Text"))
            .frame(width: 270, height: 50, alignment: .center)
            .background(Color("Button_Background").opacity(configuration.isPressed ? 0.8 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ExitButtonModifier: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("DMSans-Bold", size: 18))
            .foregroundColor(Color("Button_Text"))
            .frame(width: 180, height: 40, alignment: .center)
            .background(Color("Danger").opacity(configuration.isPressed ? 0.8 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}



struct NameButtonModifier: ButtonStyle  {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("DMSans-Bold", size: 15))
            .foregroundColor(Color("Button_Text"))
            .frame(width: 280, height: 55, alignment: .center)
            .background(Color("Button_Background").opacity(configuration.isPressed ? 0.5 : 8))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .padding(.bottom, 30)
    }
}


