//
//  YoutubeVideoPlayer.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-13.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let youTubeurl: String
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: youTubeurl) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
