//
//  FindSizeButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI

struct FindSizeButton: View {
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button(action: {
                print("Finding Size")
            }) {
                HStack {
                    Spacer()
                        Text(FIND_SIZE)
                    Spacer()
                }
            }
            .buttonStyle(MediumButtonModifier())
        }
    }
}

