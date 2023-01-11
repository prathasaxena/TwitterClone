//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct SideMenuView: View {
    @State var goToProfile = false
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading) {
                    Circle().frame(width: 48, height: 49)
                    ProfileInfo()
                    VStack(alignment: .leading, spacing: 50) {
                        ProfileFollowing().padding(.top)
                        sideMenuActionButtons
                        
                    }
                }
                Spacer()
            }.padding(.horizontal)
            Spacer()
        }
        navigationLinks
    }
}

extension SideMenuView {
    var sideMenuActionButtons : some View {
            ForEach(SideMenuAction.allCases, id: \.rawValue) { item in
                HStack {
                    Image(systemName: item.icon).font(.headline).bold()
                    Text(item.title).font(.headline)
                }.onTapGesture {
                    if(item.title == "Profile"){
                        goToProfile = true
                    }
                }
        }
    }

    var navigationLinks : some View {
        NavigationLink(destination: ProfileView(), isActive: $goToProfile) {
            
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
