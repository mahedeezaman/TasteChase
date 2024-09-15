//
//  GeneralProgressRing.swift
//  TasteChase
//
//  Created by Kobiraj on 2024-09-15.
//

import SwiftUI

extension View {
    func progressRing() -> some View {
        return
            ZStack{
                Color(.systemBackground)
                    .ignoresSafeArea()
                    .opacity(0.4)
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            }
    }
}
