//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct ProfileView: View {
    @State var filterTab : ProfileFilter = .tweets
    @Namespace var animation
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
            ProfileFollowing().padding(.horizontal)
            profileFilterView
            ScrollView {
                LazyVStack {
                    ForEach(1...10,id: \.self){_ in
                        TweetView()
                    }
                }
            }
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
        HStack(spacing: 30) {
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
        VStack {
            HStack {
                ForEach(ProfileFilter.allCases, id: \.self) { item in
                    VStack {
                        Button {
                            withAnimation(.easeInOut){
                                filterTab = item
                            }
                        } label: {
                            
                            Text(item.title).boldText()
                            
                        }
                        if(filterTab == item) {
                            Capsule().frame(height: 3)
                                .foregroundColor(.blue)
                                .matchedGeometryEffect(id: "filter", in: animation)
                        } else {
                            Capsule().frame(height: 3)
                                .foregroundColor(.clear)
                        }
                    }
                }
                
            }
            Divider().offset(y:-5)
        }.padding(.vertical)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
