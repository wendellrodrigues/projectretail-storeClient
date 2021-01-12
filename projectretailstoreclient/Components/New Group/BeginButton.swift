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
    @EnvironmentObject var shelf: Shelf
    
    @Binding var began: Bool

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
    
    func loadShelf(shelf: ShelfModel) {
        DispatchQueue.main.async {
            self.shelf.shelf = shelf
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button(action: {
                //Change began to true (user has began the process of finding their name)
                self.began = true
                
                //Load Shelf data and mount it onto CurrentShelf
                getShelf() { shelf in
                    loadShelf(shelf: shelf)
                }
                
                //Add current users to environment object nearbyUsers
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
