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
    
    @State var began: Bool = false
    
    
    var body: some View {
        VStack {
            
            
            if(currentUser.isCurUser) {
                ProductView()
                    .environmentObject(currentShelf)
                    .environmentObject(currentUser)
            }
            
            else {
                //Welcome message
                Text(began ? SELECT_NAME_INSTRUCTIONS : WELCOME_MSG_TITLE)
                    .font(Font.custom("DMSans-Bold", size: began ? 30 : 50))
                    .padding()
                    .padding(.bottom, began ? 50 : 80)
                    .animation(.easeInOut)
                
                if(began) {
                    NearbyUsersView()
                }
            
                //Button that begins search for nearby users
                BeginButton(began: $began).environmentObject(nearbyUsers)
                
            }


                            
        }
    }
}
