//
//  ContentView.swift
//  Tyler-Harry-Animations
//
//  Created by Devanna Temple Watts on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    // Day 32: Part 1 - Implicit Animations
    @State private var scale: CGFloat = 1

    var body: some View {
        VStack {
            Button("Tap Me") {
                self.scale += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scale)
            .animation(.default, value: scale)
        }
    }
    
    // Add more animations here, commenting out the previous ones
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
