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
}

