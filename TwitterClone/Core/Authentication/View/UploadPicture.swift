//
//  UploadPicture.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 29/01/23.
//
import PhotosUI
import SwiftUI

struct UploadPicture: View {
    @State var selectedItems : PhotosPickerItem?
    @State var data : Data?
    @EnvironmentObject var authViewModel : AuthViewModel
    var body: some View {
        VStack {
            AuthBgRect("Fill Details","Upload your picture")
            PhotosPicker(selection: $selectedItems,
                         matching: .images ){
                VStack {
                    if let data = data, let uiimage = UIImage(data: data) {
                       Image(uiImage: uiimage)
                            .resizable()
                            .clipShape(Circle())
                    } else {
                        Circle().foregroundColor(.gray)
                    }
                }
                    .frame(width: 200, height: 200)
                    .padding(.top,20)
            }.onChange(of: selectedItems) { selectedItems in
                guard let item = selectedItems else {
                    return
                }
                
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil")
                        }
                      
                    case .failure(let failure) :
                        fatalError("\(failure)")
                    }
                }
            }
            if let data = data, let uiimage = UIImage(data: data) {
                Button {
                    authViewModel.uploadProfileImage(image: uiimage)
                } label : {
                    Text("Continue")
                        .wideBlueButton()
                        .padding(.top,15)
                }
            }
         
            Spacer()
        }.ignoresSafeArea()
    }
}

struct UploadPicture_Previews: PreviewProvider {
    static var previews: some View {
        UploadPicture()
    }
}
