//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = "2"
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .onTapGesture {
                    selectedTab = "1"
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag("1")
            
            
            ExploreView()
                .onTapGesture {
                    selectedTab = "2"
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag("2")
            
            
            NotificationView()
                .onTapGesture {
                    selectedTab = "3"
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag("3")
            
            
            MessageView()
                .onTapGesture {
                    selectedTab = "4"
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag("4")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
