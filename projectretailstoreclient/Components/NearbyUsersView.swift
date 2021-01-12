//
//  NearbyUsersList.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import SwiftUI

struct NearbyUsersView: View {
    
    @EnvironmentObject var nearbyUsers: NearbyUsers
    @EnvironmentObject var currentUser: CurrentUser
    
    var body: some View {
        //Grid of names
        ScrollView {
            
            //Column layout is based on number of users (in order to center the items)
            if(nearbyUsers.nearbyUsers.count == 1) {
                LazyVGrid(columns: oneColumnGrid) {
                    NearbyUsersGrid()
                        .environmentObject(nearbyUsers)
                        .environmentObject(currentUser)
                }
            }
            
            //Column layout is based on number of users (in order to center the items)
            else {
                LazyVGrid(columns: twoColumnGrid) {
                    NearbyUsersGrid()
                        .environmentObject(nearbyUsers)
                        .environmentObject(currentUser)
                }
            }
        }
        .modifier(NearbyUsersGridModifier())
    }
}


struct NearbyUsersGrid: View {
    
    @EnvironmentObject var nearbyUsers: NearbyUsers
    @EnvironmentObject var currentUser: CurrentUser
    
    var body: some View {
        ForEach(nearbyUsers.nearbyUsers) { data in
            HStack {
                NameButton(data: data)
            }
        }
    }
}
