//
//  ContentView.swift
//  Challengo
//
//  Created by Aurélien on 03/06/2024
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFirstTimeUser: Bool = true
    
    var body: some View {
        NavigationStack {
            if isFirstTimeUser {
                OnboardingView1()
                    .onAppear {
                        UserDefaults.standard.set(true, forKey: "isFirstTimeUser")
                    }
            } else {
                StartView()
            }
        }
    }
}

#Preview {
    ContentView()
}
