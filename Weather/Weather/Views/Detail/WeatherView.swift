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
            
            //MARK: Weather Widget
            ScrollView(showsIndicators: false){
                VStack(spacing: 20, content: {
                    ForEach(Forecast.cities){ forecast in
                        WeatherWidget(forecast: forecast)
                    }
                })
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 120)
            }
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
