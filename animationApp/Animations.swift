//
//  Animations.swift
//  animationApp
//
//  Created by Евгений Ефимов on 14.06.2023.
//

struct Animation {
    
    let animation: String
    let curve: String
    
}

extension Animation {
    
    static func getRandomAnimation() -> Animation {
        
        var randomAnimation: String {
            let randomPosition = Int.random(in: 0..<AnimationList.shared.animations.count)
            return AnimationList.shared.animations[randomPosition]
        }
        
        var randomCurve: String {
            let randomPosition = Int.random(in: 0..<AnimationList.shared.curves.count)
            return AnimationList.shared.curves[randomPosition]
        }
        
        return Animation(animation: randomAnimation, curve: randomCurve)
        
    }
    
}
