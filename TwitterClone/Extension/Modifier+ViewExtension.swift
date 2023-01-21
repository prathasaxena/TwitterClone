//
//  ViewExtension.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI

struct MetaText : ViewModifier {
    func body(content : Content) -> some View {
        content.font(.subheadline)
            .foregroundColor(.gray)
    }
}

struct SmallMetaText : ViewModifier {
    func body(content : Content) -> some View {
        content.font(.caption)
            .foregroundColor(.gray)
    }
}

struct BoldText : ViewModifier {
    func body(content : Content) -> some View {
        content.font(.headline).bold()
            .foregroundColor(.black)
    }
}

struct GrayText : ViewModifier {
    func body(content: Content) -> some View {
        content.font(.headline)
            .foregroundColor(.gray)
    }
}

struct AuthRightLink : ViewModifier {
    func body(content: Content) -> some View {
       content
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemBlue))
    }
}

struct WideButton : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 340, height: 50)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding()
    }
}

struct ButtonShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

extension View {
    func textMeta() -> some View {
        modifier(MetaText())
    }
    
    func smallTextMeta() -> some View {
        modifier(SmallMetaText())
    }
    
    func boldText() -> some View {
        modifier(BoldText())
    }
    func grayText() -> some View {
        modifier(GrayText())
    }
    
    func authRightLink() -> some View {
        modifier(AuthRightLink())
    }
    
    func wideBlueButton() -> some View {
        modifier(WideButton())
    }
    
    func buttonShadow() -> some View {
        modifier(ButtonShadow())
    }
}

