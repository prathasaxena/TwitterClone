//
//  RoundedShape.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct RoundedShape : Shape {
    var corners : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        var path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
