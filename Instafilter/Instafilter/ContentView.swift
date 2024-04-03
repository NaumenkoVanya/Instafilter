//
//  ContentView.swift
//  Instafilter
//
//  Created by Ваня Науменко on 2.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmout = 0.0 {
        didSet {
            print("New value is \(blurAmout)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World")
                .blur(radius: blurAmout)
            Slider(value: $blurAmout, in: 0...20)
                .onChange(of: blurAmout, { oldValue, newValue in
                    print("New value is \(newValue)")
                })
                .padding()
            Button("Random blur") {
                blurAmout = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView()
}
