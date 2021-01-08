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
    
    @State var image: UIImage = UIImage(systemName: "questionmark")!

    
    //Load up a firebase image
    func loadFirebaseImage() {
        //Storage
        let storage = Storage.storage()
        // Create a reference from a Google Cloud Storage URI
        let gsReference = storage.reference(forURL: "gs://projectretail-4dd60.appspot.com/khakis.png")
        // Download in memory with a maximum allowed size of 2MB (2* 1024 * 1024 bytes)
        gsReference.getData(maxSize: 2 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          } else {
            // Data for "images/island.jpg" is returned
            self.image = UIImage(data: data!)!
            print("We have some data")
          }
        }
    }
    

    var body: some View {
        VStack {
//            Image(uiImage: (image))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxHeight: 200)
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
                
                Text("\(currentShelf.shelf.name)")
                
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
                BeginButton()
                    .environmentObject(nearbyUsers)
                    .environmentObject(currentShelf)
                
                
            }
        }
        .onAppear() {
            loadFirebaseImage()
        }
    }
}
