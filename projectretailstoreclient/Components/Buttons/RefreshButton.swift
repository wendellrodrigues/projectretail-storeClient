//
//  RefreshButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/11/21.
//

import SwiftUI

struct RefreshButton: View {
    
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
                //Load Shelf data and mount it onto CurrentShelf
                getShelf() { shelf in
                    loadShelf(shelf: shelf)
                }
                //Add current users to environment object nearbyUsers
                getNearbyUsers() { users in
                    addUsers(users: users)
                }
            }) {
                VStack {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.black)
                        .font(Font.custom("DMSans-Medium", size: 36))
                        .padding(.bottom, 10)
                    Text("Refresh")
                        .foregroundColor(Color.black)
                        .font(Font.custom("DMSans-Bold", size: 18))
                }
            }
        }
    }
}
