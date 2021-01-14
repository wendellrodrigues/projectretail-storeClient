//
//  OtherSizesButton.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 1/13/21.
//

import SwiftUI

struct Or_Divider: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 115, height: 1)
            Text("OR")
                .font(Font.custom("DMSans-Medium", size: 12))
                .foregroundColor(Color.gray.opacity(0.5))
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 115, height: 1)
        }
    }
}


