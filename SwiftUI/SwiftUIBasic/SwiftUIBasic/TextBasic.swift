//
//  TextBasic.swift
//  SwiftUIBasic
//
//  Created by Khg Dev on 2023/07/28.
//

import SwiftUI

struct TextBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // Font 사이즈를 title, body, footnote 등 정하면 responsive
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .fontWeight(.heavy)
                .bold() // .fontWeight(.bold)
                .underline(true, color: Color.red)
                .italic()
                .strikethrough(true, color: Color.green) // 글자 가운데 줄 그음
            
            // 이 방법으로 하게 되면 text 크기를 지정할 수 있습니다. font 12, 40 단점 고정식
            Text("Hello world2".uppercased())
                .font(.system(size: 25, weight: .semibold, design: .monospaced))
            
            // multiline text alignment
            Text("멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. ")
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.brown)
        }
    }
}

struct TextBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextBasic()
    }
}
