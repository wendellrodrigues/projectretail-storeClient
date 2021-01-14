//
//  PreviouslyViewedItems.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct RecentlyViewedItems: View {
    
    @EnvironmentObject var currentUser: CurrentUser
    @State var items: [ShelfBrief] = []
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(items) { item in
                    HStack {
                        ViewedItem(item: item)
                            .padding(.leading, 15)
                    }
                }
            }
        }
        .frame(width: 500, height: 110)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .onAppear {
            loadRecentlyViewedProducts()
        }
        
    }

    //Loads recently viewed products and attaches them to state
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
                    items.append(viewedItem)
                }
            }
        }
    }
}


struct ViewedItem: View {
    
    @State var item: ShelfBrief
    
    var body: some View {
        VStack {
            Image(uiImage: item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
                .padding(2)
        }
        .frame(width: 50, height: 80)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
