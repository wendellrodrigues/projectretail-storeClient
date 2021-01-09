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
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(nearbyUsers.nearbyUsers) { data in
                    HStack {
                        Text(data.id)
                            .onTapGesture {
                                //Load current user
                                getUser(uid: data.id) { user in
                                    currentUser.user = user
                                }
                                //Let view know there is a current user
                                currentUser.isCurUser = true
                            }
                    }
                }
            }
        }
        .frame(maxHeight: 100)
    }
}
