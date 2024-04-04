//
//  UnavaiLableView.swift
//  Instafilter
//
//  Created by Ваня Науменко on 4.04.24.
//

import SwiftUI

struct UnavaiLableView: View {
    var body: some View {
        ContentUnavailableView(label: {
            Label("No Mail", systemImage: "tray.fill")
        }, description: {
            Text("New mails you receive will appear here.")
        }, actions: {
            Button("Ivan") {
                
            }
            .buttonStyle(.borderedProminent)
        })
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    UnavaiLableView()
}
