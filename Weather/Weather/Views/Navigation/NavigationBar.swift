//
//  NavigationBar.swift
//  Weather
//
//  Created by EDSON SANTOS on 28/03/2024.
//

import SwiftUI

struct NavigationBar: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    
    var body: some View {
        VStack(spacing: 8){
            HStack{
                //MARK: BackButton
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 10) {
                        //MARK: Button Icon
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                        .foregroundColor(.secondary)
                        
                        //MARK: Button Label
                        Text("Wheater")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 44)
                }
                
                Spacer()
                
                //MARK: More Button
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
            }
            .frame(height: 52)
            
            //MARK: Search Bar
            HStack(spacing: 2){
                Image(systemName: "magnifyingglass")
                
                TextField("Search for a city", text: $searchText)
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in: RoundedRectangle(cornerRadius: 10))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .blue, lineWidth: 2, offsetX: 0,offsetY: 2, blur:  2)
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationBar(searchText: .constant(""))
}
