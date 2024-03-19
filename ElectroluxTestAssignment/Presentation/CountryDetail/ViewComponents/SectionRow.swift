//
//  SectionRow.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct SectionRow: View {
    private let iconString: String
    private let title: String
    private let subtitles: [String]
    private let cornerRadius: CGFloat
    private let leadingCorner: UIRectCorner
    private let trailingCorner: UIRectCorner
    
    init(
        iconString: String,
        title: String,
        subtitles: [String],
        cornerRadius: CGFloat = 0,
        leadingCorner: UIRectCorner = .bottomLeft,
        trailingCorner: UIRectCorner = .bottomRight
    ) {
        self.iconString = iconString
        self.title = title
        self.subtitles = subtitles
        self.cornerRadius = cornerRadius
        self.leadingCorner = leadingCorner
        self.trailingCorner = trailingCorner
    }
    
    var body: some View {
        HStack(spacing: 4) {
            rowImageContainer
            
            rowTextContainer
        }
        .defaultBorderShadow()
    }
    
    private var rowImageContainer: some View {
        Image(systemName: iconString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .height(.defaultIconHeight)
            .fontWeight(.light)
            .foregroundStyle(Color.theme.background300.shadow(.drop(radius: 2)))
            .padding(.horizontal, .defaultPadding)
            .padding(.vertical, .defaultSmallContentPadding)
            .background(
                Rectangle()
                    .fill(Color.theme.background200)
                    .cornerRadius(cornerRadius, corners: [leadingCorner])
            )
    }
    
    private var rowTextContainer: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundStyle(Color.theme.textAccent)
                .caption2Heavy()
            
            subtitlesContainer
        }
        .padding(.leading, .defaultPadding)
        .padding(.vertical, .defaultSmallContentPadding + 2)
        .maxWidth(.infinity, alignment: .leading)
        .background(
            Rectangle()
                .fill(Color.theme.background200)
                .cornerRadius(cornerRadius, corners: [trailingCorner])
        )
    }
    
    private var subtitlesContainer: some View {
        HStack(spacing: 0) {
            ForEach(subtitles.indices, id: \.self) { index in
                let subtitle = subtitles[index]
                
                HStack(spacing: 0) {
                    Text(subtitle)
                        .foregroundStyle(Color.theme.textPrimary)
                    
                    Text(index < subtitles.count - 1 ? String.dashWhitespace : String.empty)
                        .foregroundStyle(Color.theme.textPrimary)
                }
                .captionHeavy()
            }
        }
    }
}

#Preview {
    VStack(spacing: .x2) {
        SectionRow(
            iconString: "dollarsign.circle",
            title: "CURRENCY",
            subtitles: ["SEK"]
        )
        
        SectionRow(
            iconString: "bubble.circle",
            title: "LANGUAGES",
            subtitles: ["French", "English", "Italian"]
        )
    }
}
