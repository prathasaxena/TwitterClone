//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .bottomLeading) {
                Color(.blue)
                    .frame(height: 200)
                    .ignoresSafeArea()
                Circle()
                    .frame(width: 100, height: 100)
                    .offset(x: 15)
                    
            }
            
            profileInfo
            profileDetails
            profileFilterView
            Divider()
            Spacer()
        }
        
    }
}

extension ProfileView {
    var profileInfo : some View {
        VStack(alignment: .leading) {
            Text("pratha saxena").font(.title).bold()
            Text("@pratha_saxena").textMeta()
            
            Text("** Just act normal **").foregroundColor(.black)
                .padding(.top)
        }.padding(.leading)
    }
    
    var profileDetails : some View {
        HStack {
            HStack {
                Image(systemName: "mappin").textMeta()
                Text("Lucknow").textMeta()
            }
            HStack {
                Image(systemName: "person").textMeta()
                Text("30 March").textMeta()
            }
        }.padding(.leading)
    }
    
    var profileFilterView : some View {
        HStack {
            ForEach(ProfileFilter.allCases, id: \.self) { item in
                Button {
                    
                } label: {
                    Text(item.title).boldText()

                }
              Spacer()
            }
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
