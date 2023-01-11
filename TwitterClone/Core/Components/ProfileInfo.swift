//
//  ProfileInfo.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct ProfileInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("pratha saxena").font(.title).bold()
            Text("@pratha_saxena").textMeta()
        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo()
    }
}
