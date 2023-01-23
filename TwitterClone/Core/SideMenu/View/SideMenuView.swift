//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authVM : AuthViewModel
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
    }
}

extension SideMenuView {
    var sideMenuActionButtons : some View {
            ForEach(SideMenuAction.allCases, id: \.rawValue) { item in
                if(item == .profile) {
                    NavigationLink(destination: ProfileView()) {
                        ActionButton(item: item)
                    }
                }else  if(item == .logout) {
                    NavigationLink(destination: Login()) {
                        ActionButton(item: item).onTapGesture {
                            authVM.logout()
                        }
                    }
                } else {
                    ActionButton(item: item)
                }
            }
    }
}

struct ActionButton : View {
    var item : SideMenuAction
    var body : some View {
        HStack {
                Image(systemName: item.icon).font(.headline).bold()
                Text(item.title).font(.headline)
        }.foregroundColor(.black)
    }
}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
