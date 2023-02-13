//
//  UploadImage.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 08/02/23.
//

import Foundation
import FirebaseStorage
import UIKit

struct UploadImageHelper {
    static func uploadImage(image: UIImage, completion : @escaping (String) -> Void ) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        // create storage reference
        let filename = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "/profile_picture/\(filename)")
        reference.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                return
            }
            reference.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {
                    return
                }
                completion(imageUrl)
            }
        }
        
    }
}
