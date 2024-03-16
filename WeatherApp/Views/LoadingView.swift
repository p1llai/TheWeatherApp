//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Siddharth Pillai on 3/17/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
