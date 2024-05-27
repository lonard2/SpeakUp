//
//  LottieView.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import SwiftUI
import Lottie

struct LottieView: NSViewRepresentable {
    
    var lottieFile: String
    var loopMode: LottieLoopMode = .loop
    var animationView = LottieAnimationView()
    
    var speed: Double
    
    var height: Double
    var width: Double
    
    
    func makeNSView(context: NSViewRepresentableContext<LottieView>) -> NSView {
        let view = NSView()
        animationView.animation = LottieAnimation.named(lottieFile)
//        animationView.animation = LottieAnimation.filepath(lottieFile)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = speed
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.play(fromFrame: 1, toFrame: 32)
        
        view.addSubview(animationView)
        view.setFrameSize(CGSize(width: 150, height: 150))
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: width),
            animationView.heightAnchor.constraint(equalToConstant: height)
        ])
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        
    }
    
}
