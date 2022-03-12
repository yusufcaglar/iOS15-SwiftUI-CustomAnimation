//
//  CustomCircleAnimation.swift
//  MotionAnimation
//
//  Created by Yusuf Çağlar on 12.03.2022.
//

import SwiftUI

struct CustomCircleAnimation: View {
    
    //MARK: - Properties
    @State private var randomCircle = Int.random(in: 10...25)
    @State private var isAnimating: Bool = false
    
    func randomCoordinate(max:CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    var randomSize: CGFloat {
        let randomInt = Int.random(in: 10...300)
        return CGFloat(randomInt)
    }
    
    var randomScale: CGFloat {
        let randomDouble = Double.random(in: 0.1...2.0)
        return CGFloat(randomDouble)
    }
    
    var randomSpeed: Double {
        return Double.random(in: 0.005...2.0)
    }
    
    var randomDelay: Double {
        return Double.random(in: 0...2)
    }
    
    var randomColor: [Color] {
        let color: [Color] = [
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .indigo
        ]
        return color
    }
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(randomColor.shuffled().first)
                        .opacity(0.2)
                        .frame(width: randomSize, height: randomSize, alignment: .center)
                        .scaleEffect(isAnimating ? randomScale : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(randomSpeed)
                                    .delay(randomDelay),
                                   
                                   value: randomSpeed
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

//MARK: - Preview 
struct CustomCircleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleAnimation()
    }
}
