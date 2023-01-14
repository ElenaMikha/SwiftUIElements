//
//  TableImageView.swift
//  SwiftUIElements
//
//  Created by Elena Mikhailova on 14.01.2023.
//

import SwiftUI

struct TableImageView: View {
    let size: CGSize
    
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(size)
            .background(.gray.opacity(0.2))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 8))
            .foregroundColor(.red)
        
    }
}

struct TableImageView_Previews: PreviewProvider {
    static var previews: some View {
        TableImageView(size: CGSize(width: 250, height: 250))
    }
}

struct FrameFromSize: ViewModifier {
    let size: CGSize
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

extension View {
    func frame(_ size: CGSize) -> some View {
        modifier(FrameFromSize(size: size))
    }
}
