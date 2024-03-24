//
//  HomeView.°
//  Weather
//
//  Created by EDSON SANTOS on 24/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                //MARK: Backgroud Color
                Color.background
                    .ignoresSafeArea()
                
                //MARK: Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                //MARK: Mouse Image
                Image("House")
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10){
                    Text("Lisboa")
                        .font(.largeTitle)
                    
                    VStack{
                        Text(attributeString)
     
                        Text("Max:24° Min:18°")
                            .font(.title3.weight(.semibold))
                    }
                    
                    Spacer()
                }
                .padding(.top, 51)
                
                //MARK: TAB Bar
                TabBar(action: {})
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributeString: AttributedString{
        var string = AttributedString("19°" + "\n   " + "Céu Limpo")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Céu Limpo") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
