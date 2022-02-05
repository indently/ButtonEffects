//
//  ContentView.swift
//  ButtonEffects
//
//  Created by Federico on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.system(size: 60, weight: .bold))
                .opacity(isPressed ? 0.4 : 1.0)
                .scaleEffect(isPressed ? 1.2 : 1.0)
            
            ZStack {
                Capsule()
                    .frame(width: 150, height: 50)
                    .foregroundColor(.blue)
                
                Text("Tap me!")
                    .foregroundColor(.white)
                    .padding()
            }
            .scaleEffect(isPressed ? 1.05 : 1.0)
            .opacity(isPressed ? 0.6 : 1.0)
            .onTapGesture {
                counter += 1
            }
            .pressEvents {
                // On press
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation {
                    isPressed = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
