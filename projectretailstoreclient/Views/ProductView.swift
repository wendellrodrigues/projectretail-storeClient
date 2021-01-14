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
    @State var productImage: UIImage = UIImage()

    var body: some View  {
        VStack {
            
            HStack(alignment: .top) {
                //Left side
                VStack {
                    //Product Image
                    Image(uiImage: (productImage))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                        .padding(.bottom, 50)
                    
                    //Find Size Button
                    FindSizeButton()
                        .padding(.bottom, 20)
                    
                    //Divider that says "------OR------"
                    Or_Divider()
                        .padding(.bottom, 20)
                    
                    //Button that fetches other sizes (modal)
                    OtherSizesButton()
                        .padding(.bottom, 65)
                    
                    //Button that ends the session
                    ExitButton(began: $began)
                        .environmentObject(currentUser)
                }
                .padding(.trailing, 75)
                
                VStack(alignment: .leading) {
                    
                    //Name
                    Text(shelf.shelf.name)
                        .font(Font.custom("DMSans-Bold", size: 40))
                        .foregroundColor(Color.black)
                    
                    //Color
                    Text(shelf.shelf.color)
                        .font(Font.custom("DMSans-Medium", size: 28))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 20)
                    
                    //Long description
                    ScrollView {
                        Text(shelf.shelf.description)
                            .font(Font.custom("DMSans-Regular", size: 14))
                            .foregroundColor(Color.gray)
                            .frame(width: 500)
                    }
                    .frame(height: 50)
                    .padding(.bottom, 20)
                    
                    //Attributes
                    ScrollView {
                        ForEach(shelf.shelf.attributes) { attribute in
                            HStack {
                                Text("- \(attribute)")
                                    .font(Font.custom("DMSans-Regular", size: 14))
                                    .foregroundColor(Color.gray)
                                Spacer()
                            }
                        }
                        .frame(width: 500)
                    }
                    .frame(height: 100)
                    .padding(.bottom, 60)
                    
                    //Price
                    Text("$\(String(shelf.shelf.price))")
                        .font(Font.custom("DMSans-Medium", size: 28))
                        .foregroundColor(Color.black.opacity(0.8))
                        .padding(.bottom, 37)
                    
                    //Divider
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 500, height: 1)
                        .padding(.bottom, 30)
                    
                    //Title for previously viewed items
                    Text(PREVIOUSLY_VIEWED)
                        .font(Font.custom("DMSans-Bold", size: 16))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 30)
                    
                    //Previously Viewed Items
                    RecentlyViewedItems()
                    
                }
            }
        }
        .onAppear {
            //Load product image
            loadFirebaseImage(url: "gs://projectretail-4dd60.appspot.com/\(shelf.shelf.image)") { image in
                self.productImage = image
            }
        }
    }
}

