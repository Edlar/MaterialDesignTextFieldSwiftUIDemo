//
//  ContentView.swift
//  MaterialDesignTextFieldSwiftUIDemo
//
//  Created by Eduard Laryushkin on 16.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Material Design")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var text = ""
    @State var isTapped = false
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 15) {
                    TextField("", text: $text) { status in
                        // It will fire when text field is clicked
                        if status {
                            withAnimation(.easeIn) {
                                // Moving hint to top
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        // It will fire when return button is pressed
                        if text == "" {
                            withAnimation(.easeOut) {
                                // Moving hint to down
                                isTapped = false
                            }
                        }
                    }
                    Button(action: {print("Test")}) {
                        Image(systemName: "suit.heart")
                            .foregroundColor(isTapped ? .accentColor : .gray)
                    }
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text("UserName")
                        .foregroundColor(isTapped ? .accentColor : .gray)
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -0.7 : 0, y: isTapped ? -15 : 0)
                    , alignment: .leading
                )
                .padding(.horizontal, 10)
                // Divider color
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 10)
            }
            .padding(.top, 12)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)
        }
        .padding()
    }
}
