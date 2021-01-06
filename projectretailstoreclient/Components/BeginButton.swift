//
//  BeginButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import SwiftUI


struct BeginButton: View {
    
    
    @State var nearbyUsers: Array<UserBrief> = []
    
    var body: some View {
        Button(action: {
            getNearbyUsers() { output in
                print("Output from view: \(output)")
                
                nearbyUsers = output
    
            }
            
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
