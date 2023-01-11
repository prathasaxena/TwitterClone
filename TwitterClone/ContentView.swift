//
//  ContentView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSideMenu = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showSideMenu)
            if(showSideMenu) {
                ZStack {
                    Color(.black).opacity(0.5)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showSideMenu = false
                    }
                }
            }
            SideMenuView()
                    .background(Color(.white))
                    .frame(width: 300)
                    .offset(x: showSideMenu ? 0 : -300, y:0)

            
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading ) {
                Button {
                    withAnimation(.easeInOut){
                        showSideMenu.toggle()
                    }
                } label: {
                    Circle().frame(width: 30, height: 30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
