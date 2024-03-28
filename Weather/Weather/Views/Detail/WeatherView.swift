//
//  WheaterView.swift
//  Weather
//
//  Created by EDSON SANTOS on 28/03/2024.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
        }
        .overlay{
            NavigationBar()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WeatherView()
        .preferredColorScheme(.dark)
}
