//
//  NatureGrowthView.swift
//  Challengo
//
//  Created by Aurélien on 05/06/2024.
//
//

import SwiftUI

struct NatureGrowthView: View {
    @State var offset: CGSize = .zero
    @State private var startLocation: CGSize = .zero
    
    let darkGreen = Color(red: 34/255, green: 139/255, blue: 34/255)
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image(systemName: "tree.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundColor(darkGreen)
                .offset(x: offset.width, y: offset.height)                .gesture(
                    DragGesture ()
                        .onChanged { gesture in
                            withAnimation(.spring()) {
                                self.offset = CGSize(width: self.startLocation.width + gesture.translation.width,
                                                     height: self.startLocation.height + gesture.translation.height)                            }
                        }
                        .onEnded { gesture in
                            self.startLocation = self.offset
                        }
                )
        }
    }
}

#Preview {
    NatureGrowthView()
}

