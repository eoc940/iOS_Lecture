//
//  ImageBasic.swift
//  SwiftUIBasic
//
//  Created by Khg Dev on 2023/07/29.
//

import SwiftUI

struct ImageBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("photoImage")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(150)
            
            Divider()
            
            Image("photoImage")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
        }
    }
}

struct ImageBasic_Previews: PreviewProvider {
    static var previews: some View {
        ImageBasic()
    }
}
