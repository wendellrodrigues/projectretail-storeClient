//
//  ContentView.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 11/10/20.
//

import SwiftUI
import Firebase
import FirebaseStorage


struct Home: View {
    
    @EnvironmentObject var nearbyUsers: NearbyUsers
    @EnvironmentObject var currentShelf: Shelf
    @EnvironmentObject var currentUser: CurrentUser
    
    
    //Began is a variable toggled ON when a user selects their name.
    //It is toggled OFF when a user selects exit
    @State var began: Bool = false
    
    
    var body: some View {
        VStack {
            
            if(currentUser.isCurUser) {
                ProductView(began: $began)
                    .environmentObject(currentShelf)
                    .environmentObject(currentUser)
            }
            
            else {
                //Welcome message
                Text(began ? SELECT_NAME_TITLE : WELCOME_MSG_TITLE)
                    .font(Font.custom("DMSans-Bold", size: 50))
                    .padding(.bottom, began ? 10 : 50)
                
                if(began) {
                    Text(SELECT_NAME_INSTRUCTIONS)
                        .font(Font.custom("DMSans-Bold", size: 25))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 40)
                }
                
                if(began) {
                    //Grid of nearby users to select
                    NearbyUsersView()
                        .padding(.top, 20)
                    //Button that refreshes search for nearby users
                    RefreshButton(began: $began)
                        .environmentObject(nearbyUsers)
                        .environmentObject(currentShelf)
                }
                
                else {
                    //Button that begins search for nearby users
                    BeginButton(began: $began)
                        .environmentObject(nearbyUsers)
                        .environmentObject(currentShelf)
                }
           
            }
        }
    }
}
