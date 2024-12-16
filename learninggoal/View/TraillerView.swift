//
//  TraillerView.swift
//  learninggoal
//
//  Created by Ousmane on 09/12/24.
//

import SwiftUI
import WebKit
struct TraillerView: View {
    @StateObject private var vm = ApiManagementVM()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VideoPlayer(videoId: vm.key)
                    
                
            
        }.task{
            try! await  vm.fetchVideo()
        }
            }
}

#Preview {
    TraillerView()
}

struct VideoPlayer: UIViewRepresentable{
    var videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)")else{return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}
