//
//  LottieView.swift
//  SkyScope
//
//  Created by Nafea Elkassas on 14/10/2025.
//
import SwiftUI
import Lottie
struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    
    init(name: String, loopMode: LottieLoopMode = .loop, animationSpeed: CGFloat = 1) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed
    }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        return animationView
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}
