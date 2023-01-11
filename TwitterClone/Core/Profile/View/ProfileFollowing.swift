//
//  ProfileFollowing.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct ProfileFollowing: View {
    var body: some View {
        HStack() {
            HStack{
                Text("25").boldText()
                Text("Following").grayText()
            }
            HStack{
                Text("5").boldText()
                Text("Followers").grayText()
            }
        }
    }
}

struct ProfileFollowing_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowing()
    }
}
