//
//  BeginButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 12/29/20.
//

import SwiftUI
import Combine


struct BeginButton: View {
    
    @EnvironmentObject var nearbyUsers: NearbyUsers

    func addUsers(users: [UserBrief]) {

        //Add to list
        DispatchQueue.main.async {
            //Clear list (refresh)
            nearbyUsers.nearbyUsers.removeAll()
            
            for user in users {
                nearbyUsers.nearbyUsers.append(user)
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button(action: {
                getNearbyUsers() { users in
                    addUsers(users: users)
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
    

}
