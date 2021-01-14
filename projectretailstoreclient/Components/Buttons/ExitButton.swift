//
//  ExitButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI


struct ExitButton: View {
    
    @Binding var began: Bool
    @EnvironmentObject var currentUser: CurrentUser
    
    var body: some View {
            Button(action: {
                self.began = false
                self.currentUser.user = placeholderUser
                self.currentUser.isCurUser = false
            }) {
                HStack {
                    Spacer()
                        Text(EXIT)
                    Spacer()
                }
            }
            .buttonStyle(ExitButtonModifier())
        }
}

