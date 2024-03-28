//
//  WheaterView.swift
//  Weather
//
//  Created by EDSON SANTOS on 28/03/2024.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var searchText = ""
    var searchResult: [Forecast]{
        if searchText.isEmpty{
            return Forecast.cities
        }else{
            return Forecast.cities.filter { $0.location.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            //MARK: Weather Widget
            ScrollView(showsIndicators: false){
                VStack(spacing: 20, content: {
                    ForEach(searchResult){ forecast in
                        WeatherWidget(forecast: forecast)
                    }
                })
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or aiport")
    }
}

#Preview {
    NavigationView {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
