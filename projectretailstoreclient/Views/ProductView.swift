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
    
    
    @State var productImage: UIImage = UIImage(systemName: "questionmark")!
    
    @State var recentlyViewedItems: [ShelfBrief] = []
    
    var body: some View  {
        VStack {
            Text("\(self.shelf.shelf.name)")
            Image(uiImage: (productImage))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 200)
            Text("\(currentUser.user.firstName)")
                .padding(.bottom, 40)
            
            ForEach(recentlyViewedItems) { item in
                Image(uiImage: item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }
                     
            Text("Exit")
                .onTapGesture {
                    self.began = false
                    self.currentUser.user = placeholderUser
                    self.currentUser.isCurUser = false
                }
        }
        .onAppear {
            
            //Load product image
            loadFirebaseImage(url: "gs://projectretail-4dd60.appspot.com/\(shelf.shelf.image)") { image in
                self.productImage = image
            }

            //Load recently viewed product objects
            loadRecentlyViewedProducts()
            
        }
    }
    

    //Load up an image on firebase
    func loadFirebaseImage(url: String, completion: @escaping(UIImage) -> Void) -> Void {
        //Initial image
        var image = UIImage(systemName: "sun.min")!
        //Storage
        let storage = Storage.storage()
        // Create a reference from a Google Cloud Storage URI
        let gsReference = storage.reference(forURL: url)
        // Download in memory with a maximum allowed size of 2MB (2* 1024 * 1024 bytes)
        gsReference.getData(maxSize: 2 * 1024 * 1024) { data, error in
            if error != nil {
            completion(image)
          } else {
            // Data for "images/island.jpg" is returned
            image = UIImage(data: data!)!
            completion(image)
          }
        }
    }
    
    
    func loadRecentlyViewedProducts() {
        //Loop through user object styles array for uids
        let styles = currentUser.user.styles
        for style in styles {
            //Assign placeholder shelf to received shelf object
            getShelfWithId(uid: style) { shelf in
                //Load image
                loadFirebaseImage(url: "gs://projectretail-4dd60.appspot.com/\(shelf.image)") { image in
                    //Create shelf brief using items
                    let viewedItem = ShelfBrief(id: UUID(), uid: shelf.uid, image: image)
                    //Append to recentlyViewedItems
                    recentlyViewedItems.append(viewedItem)
                }
            }
        }
    }
}

