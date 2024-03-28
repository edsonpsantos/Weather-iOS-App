//
//  ForecastCard.swift
//  Weather
//
//  Created by EDSON SANTOS on 28/03/2024.
//

import SwiftUI

struct ForecastCard: View {
    
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    
    var isActive: Bool {
        if forecastPeriod == ForecastPeriod.hourly {
            let isThisHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            
            return isThisHour
        } else {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            
            return isToday
        }
    }
    
    var body: some View {
        ZStack{
            //MARK: Card
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60, height: 146)
                .shadow(color: .black.opacity(0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5,y:4)
                .overlay{
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            
            //MARK: Content
            VStack(spacing: 16){
                //MARK: Forecast Date
                Text(forecast.date, format: forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                
                VStack(spacing: -4){
                    //MARK: Forecast Small Icon
                    Image(forecast.icon)
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                    
                    //MARK: Forecast Probality
                    Text(forecast.probability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probability > 0 ? 1 : 0)
                        
                }
                .frame(height: 42)
                
                //MARK: Forecast Temperature
                Text("\(forecast.temperature)°")
                    .font(.title3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 60, height: 146)
        }
    }
}

#Preview {
    ForecastCard(forecast: Forecast.hourly[0], forecastPeriod: .hourly)
}
