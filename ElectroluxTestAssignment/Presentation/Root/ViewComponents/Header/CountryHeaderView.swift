//
//  CountryHeaderView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct CountryHeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String.headerTitle)
                .foregroundStyle(Color.theme.textPrimary)
                .title2Heavy()
            
            Text(String.headerSubtitle)
                .footnoteSemiboldItalic()
                .foregroundStyle(Color.theme.textAccent)
        }
        .maxWidth(.infinity, alignment: .leading)
        .maxHeight(.defaultHeaderHeight, alignment: .bottom)
        .padding([.horizontal, .bottom], .defaultPadding)
        .padding(.top, .defaultLargeContentPadding)
        .background(headerBackground)
    }
    
    private var headerBackground: some View {
        LinearGradient(
            colors: [
                Color.theme.background100,
                Color.theme.background200
            ],startPoint: .bottom, endPoint: .top
        )
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
        .shadow(color: .black, radius: 8, x: 0, y: 5)
    }
}

#Preview {
    CountryHeaderView()
}
