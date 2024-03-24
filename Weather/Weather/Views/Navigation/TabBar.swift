//
//  TabBar.swift
//  Weather
//
//  Created by EDSON SANTOS on 24/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    var action:() -> Void
    
    var body: some View {
        ZStack{
            //MARK: Arc Shape
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay {
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
            
            
            //MARK: TAB Items
            HStack{
                //MARKS: Expand Button
                Button(action: {
                    action()
                }, label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                })
                
                Spacer()
                
                //MARK: Navigation Button
                NavigationLink {
                    EmptyView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    TabBar(action: {})
        .preferredColorScheme(.dark)
}
