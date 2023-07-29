//
//  GradientBasic.swift
//  SwiftUIBasic
//
//  Created by Khg Dev on 2023/07/29.
//

import SwiftUI

struct GradientBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // Linear Gradient
            Text("Linear Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottom)
                )
                .frame(width: 300, height: 200)
            
            // Radial Gradient
            Text("Radial Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [.yellow, .purple]),
                        center: .leading,
                        startRadius: 5,
                        endRadius: 300)
                )
                .frame(width: 300, height: 200)
            
            // Augular Gradient
            Text("Augular Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(
                        colors: [.blue, .green],
                        center: .topLeading,
                        angle: .degrees(180 + 45))
                )
                .frame(width: 300, height: 200)
        }
    }
}

struct GradientBasic_Previews: PreviewProvider {
    static var previews: some View {
        GradientBasic()
    }
}
