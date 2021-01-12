//
//  NameButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import SwiftUI

struct NameButton: View {
    
    @EnvironmentObject var nearbyUsers: NearbyUsers
    @EnvironmentObject var currentUser: CurrentUser
    
    @State var data: UserBrief
    
    var body: some View {
    
        Button(action: {
            //POST request to get user info and set to current user
            getUser(uid: data.id) { user in
                currentUser.user = user
            }
            //Let view know there is a current user
            currentUser.isCurUser = true
        }) {
            HStack {
                Spacer()
                Text(data.name)
                Spacer()
            }
        }
        .buttonStyle(NameButtonModifier())
            
        
    }
}

