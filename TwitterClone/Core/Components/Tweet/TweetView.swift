//
//  TweetView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct TweetView: View {
    var body: some View {
        VStack(alignment: .leading ) {
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 65, height: 65)
                VStack(alignment: .leading){
                    HStack {
                        // name
                        Text("ABP News")
                            .font(.subheadline).bold()
                        // verified
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                        //handle
                        Text("@ABPNews").textMeta()
                        // time
                        Text(". 55m").textMeta()
                    }
                    // tweet
                    Text("I hope that people of brazil are able to resolve the matter quickly and peacefully")
                        .multilineTextAlignment(.leading)
                   
                }
             
            }
            HStack() {
                Button {
                    // action
                } label: {
                    HStack{
                        Image(systemName: "chart.bar.xaxis")
                        Text("1.7M")
                    }
                }
                Spacer()
                Button {
                    // action
                } label: {
                    HStack{
                        Image(systemName: "message")
                        Text("3,214")
                    }
                  
                }
                Spacer()
                Button {
                    // action
                } label: {
                    HStack {
                        Image(systemName: "repeat")
                        Text("3,465")
                    }
                }
                Spacer()
                Button {
                    // action
                } label: {
                    HStack{
                        Image(systemName: "heart")
                        Text("59.4K")
                    }
                  
                }
            }.smallTextMeta()
        }.padding()
        Divider()
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView()
    }
}
