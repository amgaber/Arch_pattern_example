//
//  ProgressView.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 25/11/2024.
//

import SwiftUI

struct ProgressSwiftUIView: View {
    
    var body: some View {
        ProgressView() {
                    Text("Processing..")
                }
                .padding()
                .tint(.green)
                .foregroundStyle(.blue)
                .background(Color.gray.opacity(0.25))
                .border(.yellow, width: 2)
    }
}

#Preview {
    ProgressSwiftUIView()
}
