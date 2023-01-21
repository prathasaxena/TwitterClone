//
//  AuthBgRect.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct AuthBgRect: View {
    let titleText: String
    let bottomTitleText : String
    
    init(_ titleText: String,_ bottomTitleText: String) {
        self.titleText = titleText
        self.bottomTitleText = bottomTitleText
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(titleText)
                Text(bottomTitleText)
                HStack { Spacer() }
            }.font(.largeTitle)
                .fontWeight(.semibold)
              
        }.frame(height: 250)
            .padding()
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
    }

}

struct AuthBgRect_Previews: PreviewProvider {
    static var previews: some View {
        AuthBgRect("Title", "Bottom Title")
    }
}
