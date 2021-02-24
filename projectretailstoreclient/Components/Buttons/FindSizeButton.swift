//
//  FindSizeButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI

struct FindSizeButton: View {
    
    @EnvironmentObject var currentUser: CurrentUser
    @EnvironmentObject var shelf: Shelf
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button(action: {
                print("Finding Size")
                handleFindSize(shelf: shelf, currentUser: currentUser)
            }) {
                HStack {
                    Spacer()
                        Text(FIND_SIZE)
                    Spacer()
                }
            }
            .buttonStyle(MediumButtonModifier())
        }
    }
}


//Handles the Find Size
//Searches database shelf object to match user size with shelf sizes
//Sends request to light up shelf
func handleFindSize(shelf: Shelf, currentUser: CurrentUser) {
    
    let gender = shelf.shelf.gender
    let type = shelf.shelf.type
    
    //Sizes
    var femalePantSize = currentUser.user.femalePantsSize
    var femaleShirtSize = currentUser.user.femaleShirtSize
    var maleLengthSize = currentUser.user.maleLengthSize
    var maleShirtSize = currentUser.user.maleShirtSize
    var maleWaistSize = currentUser.user.maleWaistSize
    
    //Male Pants
    if(gender == "male" && type == "pants") {
        //Search shelf sizes
        for size in shelf.shelf.sizes {
            if(size.maleLengthSize == maleLengthSize && size.maleWaistSize == maleWaistSize) {
                //One of the sizes has matched the user's specified size
                findMySize(shelf: size.shelf) //Send request to light up the shelf
            }
        }
    }
    
    //Male Shirt
    if(gender == "male" && type == "shirt") {
        //Search shelf sizes
        for size in shelf.shelf.sizes {
            if(size.maleShirtSize == maleShirtSize) {
                //One of the sizes has matched the user's specified size
                findMySize(shelf: size.shelf) //Send request to light up the shelf
            }
        }
    }
    
    //Female Pants
    if(gender == "female" && type == "pants") {
        //Search shelf sizes
        for size in shelf.shelf.sizes {
            if(size.femalePantSize == femalePantSize) {
                //One of the sizes has matched the user's specified size
                findMySize(shelf: size.shelf) //Send request to light up the shelf
            }
        }
    }
    
    //FemaleShirt
    if(gender == "male" && type == "shirt") {
        //Search shelf sizes
        for size in shelf.shelf.sizes {
            if(size.femaleShirtSize == femaleShirtSize) {
                //One of the sizes has matched the user's specified size
                findMySize(shelf: size.shelf) //Send request to light up the shelf
            }
        }
    }
}

