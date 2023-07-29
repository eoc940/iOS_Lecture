//
//  IconBasic.swift
//  SwiftUIBasic
//
//  Created by Khg Dev on 2023/07/29.
//

import SwiftUI

struct IconBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "house")
                .resizable()
            // renderingMode에서 original로 하면 실제 colordㅔ서 multi color로 변경되게 됩니다. 즉 고유 값 컬러로 변경되어 color를 변경하더라도 변경되지 않는 컬러 값이 됩니다
                .renderingMode(.original)
                .scaledToFill()
                .foregroundColor(.red)
                .frame(width: 300, height: 300)
        }
    }
}

struct IconBasic_Previews: PreviewProvider {
    static var previews: some View {
        IconBasic()
    }
}
