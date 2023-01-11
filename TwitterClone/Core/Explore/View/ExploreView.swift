//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(0...30, id: \.self){ _ in
                    ExploreGridItem()
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
