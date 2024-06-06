//
//  CongratsView.swift
//  Challengo
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI

struct CongratsView: View {
    @State private var isPressed = false

    
    var body: some View {
        ZStack {
        
            Image("ValleySun")
                .resizable()
                .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                Text("Félicitation!!").font(.largeTitle).fontWeight(.bold)
                Text("Tu peux planter ton arbre").font(.title2).fontWeight(.medium)
                Image("arbre1")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .scaleEffect(isPressed ? 1.0 : 2.0)
                    .animation(.easeInOut, value: isPressed)
                    .gesture(
                                TapGesture()
                                    .onEnded({
                                        self.isPressed.toggle()
                                    })
                                )
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }

        }
    }
}

#Preview {
    CongratsView()
}
