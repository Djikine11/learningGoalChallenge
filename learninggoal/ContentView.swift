//
//  ContentView.swift
//  learninggoal
//
//  Created by Ousmane on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView{
                Tab("coins", systemImage: "bitcoinsign"){
                    Home()
                }
                
                Tab("Trailers", systemImage: "movieclapper"){
                    TraillerView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
