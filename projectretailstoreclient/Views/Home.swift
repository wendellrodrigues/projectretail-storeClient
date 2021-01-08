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
    
    @ObservedObject var nearbyUsers = NearbyUsers()
    
    @EnvironmentObject var currentShelf: Shelf
    @EnvironmentObject var currentUser: CurrentUser
    
    
    
    var body: some View {
        VStack {
            
            if(nearbyUsers.nearbyUsers.count == 0) {
                //Welcome message
                Text(WELCOME_MSG_TITLE)
                    .font(Font.custom("DMSans-Bold", size: 50))
                    .padding()
                    .padding(.bottom, 50)
                
                //Button that begins search for nearby users
                BeginButton().environmentObject(nearbyUsers)
            } else {
                
                if(currentUser.isCurUser) {
                    ProductView()
                        .environmentObject(currentShelf)
                        .environmentObject(currentUser)
                }
                
                else {
                
                    //Instructions to select name
                    Text(SELECT_NAME_INSTRUCTIONS)
                        .font(Font.custom("DMSans-Bold", size: 30))
                        .padding()
                        .padding(.bottom, 50)
                    
                    Text("\(currentShelf.shelf.name)")
                    
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
                    
                    //Refresh Button
                    BeginButton()
                        .environmentObject(nearbyUsers)
                        .environmentObject(currentShelf)
                        
                }
                
                
            }
        }
    }
}
