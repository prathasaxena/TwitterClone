//
//  UploadTweet.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct UploadTweet: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .font(.headline)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Tweet")
                        .font(.headline)
                        .padding(.horizontal,15)
                        .padding(.vertical,10)
                }
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            HStack(alignment: .top){
                Circle()
                    .frame(width: 60, height: 60)
                TextArea(placeholder: "What's happening?", text: $caption)
            }.padding(.vertical,30)
            Spacer()
        }.padding()
    }
}

struct UploadTweet_Previews: PreviewProvider {
    static var previews: some View {
        UploadTweet()
    }
}
