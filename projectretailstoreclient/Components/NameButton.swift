//
//  NameButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import SwiftUI

struct NameButton: View {
    

    
    
    var body: some View {
        
        
        Button(action: {
            print("yo")
        }) {
            HStack {
                Spacer()
                    Text(BEGIN_BUTTON)
                Spacer()
            }
        }
        .buttonStyle(LargeButtonModifier())
            
        
    }
}

