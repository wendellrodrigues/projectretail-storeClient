//
//  ContentView.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 11/10/20.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var nearbyUsers = NearbyUsers()
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
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
                //Instructions to select name
                Text(SELECT_NAME_INSTRUCTIONS)
                    .font(Font.custom("DMSans-Bold", size: 30))
                    .padding()
                    .padding(.bottom, 50)
                
                //Grid of names
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid) {
                        ForEach(nearbyUsers.nearbyUsers) { data in
                            Text(data.name)
                        }
                    }
                }
                .frame(maxHeight: 100)
                
                //Refresh Button
                BeginButton().environmentObject(nearbyUsers)
                
                
            }
        }
       
    }
}
