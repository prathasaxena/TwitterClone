//
//  ExploreGridItem.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct ExploreGridItem: View {
    var body: some View {
        NavigationLink(destination: ProfileView()) {
            HStack(spacing : 10) {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.black)
                VStack(alignment: .leading) {
                    Text("Andrew").font(.subheadline).bold()
                    Text("andrewtate").font(.subheadline)
                }.foregroundColor(.black)
                Spacer()
            }.padding()
        }
    }
}

struct ExploreGridItem_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGridItem()
    }
}
