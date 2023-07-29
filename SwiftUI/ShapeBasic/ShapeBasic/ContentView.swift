//
//  ContentView.swift
//  ShapeBasic
//
//  Created by Khg Dev on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Circle 원형
            Text("원형")
                .font(.title)
            Circle()
//                .fill(Color.blue)
//                .foregroundColor(.pink)
//                .stroke(.red, lineWidth: 20)
//                .stroke(.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30]))
                .trim(from: 0.2, to: 1.0)
                .stroke(.purple, lineWidth: 50)
                .frame(width: 200, height: 100)
                .padding()
            
            // Eclipse 타원형
            Text("타원형")
                .font(.title)
            Ellipse()
                .fill(.green)
                .frame(width: 200, height: 100, alignment: .center)
            
            // 캡슐형
            Text("캡슐형")
                .font(.title)
            Capsule(style: .circular)
                .stroke(.blue, lineWidth: 30)
                .frame(width: 200, height: 100, alignment: .center)
                
        }
        
        VStack(spacing: 20) {
            // 직사각형
            Text("직사각형")
                .font(.title)
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 100, alignment: .center)
            
            // 둥근 직사각형
            Text("둥근 직사각형")
                .font(.title)
            RoundedRectangle(cornerRadius: 30)
                .trim(from: 0.4, to: 1.0)
                .frame(width: 300, height: 200, alignment: .center)
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
