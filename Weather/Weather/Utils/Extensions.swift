//
//  Extensions.swift
//  Weather
//
//  Created by EDSON SANTOS on 24/03/2024.
//


import SwiftUI


extension Color {
    
    static let background = LinearGradient(gradient: Gradient(colors: [Color("Background1"), Color("Background2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let bottomSheetBackground = LinearGradient(gradient: Gradient(colors: [Color("Background1").opacity(0.26), Color("Background2").opacity(0.26)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let navBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Background1").opacity(0.1), Color("Background2").opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let tabBarBackground = LinearGradient(gradient: Gradient(colors: [Color("TabBar_Background1").opacity(0.26), Color("TabBar_Background2").opacity(0.26)]), startPoint: .top, endPoint: .bottom)
    
    static let weatherWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather_Widget_Background1"), Color("Weather_Widget_Background2")]), startPoint: .leading, endPoint: .trailing)
    
    static let bottomSheetBorderMiddle = LinearGradient(gradient: Gradient(stops: [.init(color: .white, location: 0), .init(color: .clear, location: 0.2)]), startPoint: .top, endPoint: .bottom)
    
    static let bottomSheetBorderTop = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white.opacity(0.5), .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    
    static let underline = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    
    static let tabBar_Border = Color("TabBar_Border").opacity(0.5)
    
    static let forecast_Card_Background = Color("Forecast_Card_Background")
    
    static let probability_Text = Color("Probability_Text")
}

extension View {
    
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(
                Blur(radius: radius, opaque: opaque)
            )
    }
}

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
