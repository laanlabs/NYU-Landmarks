//
//  ControlView.swift
//  NYU-Landmarks
//
//  Created by Jeongin Yoon on 4/10/22.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        VStack {
            ControlVisibilityToggleButton()
            
            Spacer()
            
            ControlButtonBar()
        }
    }
}

struct ControlVisibilityToggleButton: View {
    var body: some View {
        HStack {
            
        }
    }
}

struct ControlButtonBar: View {
    var body: some View {
        HStack {
            ControlButton(systemIconName: "map") {
                print("Map button pressed")
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
