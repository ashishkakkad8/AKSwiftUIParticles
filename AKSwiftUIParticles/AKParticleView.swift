//
//  AKParticleView.swift
//  AKSwiftUIParticles
//
//  Created by Ashish Kakkad on 30/04/22.
//

import SwiftUI
import SpriteKit

struct AKParticleView: View {
    
    @State var animatedText: String = ""
    @State private var flag = true
    
    var scene: SKScene {
        let scene = FirefilesScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            VStack() {
                Spacer()
                Text(animatedText)
                    .font(.title)
                    .fontWeight(.light)
                    .animation(.spring())
                    .padding()
            }
        }
        .onAppear{
            animatedText = ""
            "Ashish Kakkad".enumerated().forEach { index, character in
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                    animatedText += String(character)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AKParticleView()
    }
}
