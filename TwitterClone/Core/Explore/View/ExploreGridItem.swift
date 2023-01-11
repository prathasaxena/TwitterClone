//
//  ExploreGridItem.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct ExploreGridItem: View {
    var body: some View {
        HStack(spacing : 10) {
            Circle()
                .frame(width: 35, height: 35)
            VStack(alignment: .leading) {
                Text("Andrew").font(.subheadline).bold()
                Text("andrewtate").font(.subheadline)
            }
            Spacer()
        }.padding()
    }
}

struct ExploreGridItem_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGridItem()
    }
}
