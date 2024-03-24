//
//  HomeView.°
//  Weather
//
//  Created by EDSON SANTOS on 24/03/2024.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom

                let imageOffset = screenHeight + 36

                ZStack{
                    //MARK: Backgroud Color
                    Color.background
                        .ignoresSafeArea()
                    
                    //MARK: Background Image
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)

                    //MARK: Mouse Image
                    Image("House")
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)

                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text("Lisboa")
                            .font(.largeTitle)
                        
                        VStack{
                            Text(attributeString)
                            
                            Text("Max:24°   Min:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)

                    
                    //MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(bottomSheetTranslationProrated.formatted())
                    } content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut){
                            if(bottomSheetPosition == BottomSheetPosition.top){
                                hasDragged = true
                            } else{
                                hasDragged=false
                            }
                        }
                    }
                    
                    //MARK: TAB Bar
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)

                }
                .navigationBarHidden(true)
            }
        }
    }
    
    private var attributeString: AttributedString{
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n ") + "Céu Limpo")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight:  hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
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
