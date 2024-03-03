//
//  ContentView.swift
//  Tyler-Harry-Animations
//
//  created by Tyler Harry on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    // Day 32: Part 1 - Animations
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 0
    @State private var opacity: Double = 1
    @State private var dragAmount = CGSize.zero

    // Day 33: Part 2 - More Advanced Animations
    @State private var enabled = false
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            // Implicit animation
            Button("Tap Me") {
                self.scale += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scale)
            .animation(.default, value: scale)

            // Customizing animations
            Button("Tap Me") {
                self.angle += 360
                self.opacity -= 0.2
            }
            .padding(50)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2), value: angle)
            .animation(.easeInOut(duration: 2), value: opacity)

            // Animating bindings
            VStack {
                Slider(value: $angle, in: 0...360, step: 1)
                    .padding()
                Text("Angle: \(angle, specifier: "%.0f") degrees")
            }
            .animation(.linear(duration: 1), value: angle)

            // Explicit animations
            Button("Tap Me") {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                    self.dragAmount = CGSize(width: 100, height: 0)
                }
            }
            .padding(50)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .offset(dragAmount)

            // Controlling the animation stack
            Button("Tap Me") {
                self.enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? Color.blue : Color.red)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)

            // Animating gestures
            VStack {
                Text("Drag Me")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.dragAmount = .zero
                                }
                            }
                    )
                    .animation(.spring(), value: dragAmount)
            }

            // Showing and hiding views with transitions
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        self.isShowingRed.toggle()
                    }
                }
                if isShowingRed {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }

            // Building custom transitions using ViewModifier
            // You can create a custom transition here
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
