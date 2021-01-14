//
//  OtherSizesButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI

struct OtherSizesButton: View {
    
    //Insert function here (should pull up modal)
    
    var body: some View {
        Button(action: {
            print("Finding Other Sizes")
        }) {
           Text(OTHER_SIZES)
            .font(Font.custom("DMSans-Bold", size: 16))
            .foregroundColor(Color.gray)
        }
    }
}

