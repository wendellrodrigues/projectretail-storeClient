//
//  ContentView.swift
//  projectretailstoreclient
//
//  Created by Wendell Rodrigues on 11/10/20.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text(WELCOME_MSG_TITLE)
                .font(Font.custom("DMSans-Bold", size: 50))
                .padding()
                .padding(.bottom, 50)
            BeginButton()
        }
       
    }
}
