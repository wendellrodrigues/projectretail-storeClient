//
//  ProductView.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/8/21.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ProductView: View {
    
    @EnvironmentObject var shelf: Shelf
    @EnvironmentObject var currentUser: CurrentUser
    
    @Binding var began: Bool
    
    let placeholderUser = User(uid: "", firstName: "", email: "", hasEnteredSizingPreferences: false, femalePantsSize: "", femaleShirtSize: "", maleShirtSize: "", maleLengthSize: 0, maleWaistSize: 0, styles: [])
    
    @State var productImage: UIImage = UIImage(systemName: "questionmark")!
    
    var body: some View  {
        VStack {
            Text("\(self.shelf.shelf.name)")
            Image(uiImage: (productImage))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 200)
            Text("\(currentUser.user.firstName)")
            
            Text("Exit")
                .onTapGesture {
                    self.began = false
                    self.currentUser.user = placeholderUser
                    self.currentUser.isCurUser = false
                }
        }
        .onAppear {
            loadFirebaseImage()
        }
    }
    
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
            self.productImage = UIImage(data: data!)!
            print("We have some data")
          }
        }
    }
}

