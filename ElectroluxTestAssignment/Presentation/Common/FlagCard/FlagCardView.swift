//
//  FlagCardView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct FlagCardView: View {
    private let countryId: String
    private let countryName: String
    private let imageString: String
    
    private let namespaceId: Namespace.ID
    
    init(
        country: CountryItem,
        namespaceId: Namespace.ID
    ) {
        self.countryId = country.id
        self.countryName = country.name
        self.imageString = country.flagImageString
        self.namespaceId = namespaceId
    }
    var body: some View {
        cardContainer
            .matchedGeometryEffect(id: countryId, in: namespaceId)
    }
    
    private var cardContainer: some View {
        VStack(spacing: 4) {
            imageContainer
            
            bottomRowContainer
        }
        .defaultBorderShadow()
    }
    
    private var imageContainer: some View {
        Image(String.flagFolderRef + imageString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .height(.defaultFlagImageHeight)
            .shadow(color: .black.opacity(0.5), radius: .x1, x: 0, y: .x1)
            .maxWidth(.infinity)
            .padding(.vertical, .defaultLargeContentPadding)
            .background(Color.theme.background200)
            .cornerRadius(.defaultCornerRadius, corners: [.topLeft, .topRight])
    }
    
    private var bottomRowContainer: some View {
        HStack(spacing: 4) {
            iconContainer
            
            countryTextContainer
        }
    }
    
    private var iconContainer: some View {
        Image(systemName: "globe.desk")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .height(.defaultIconHeight)
            .fontWeight(.semibold)
            .foregroundStyle(Color.theme.background300.shadow(.drop(radius: 2)))
            .padding(.horizontal, .defaultPadding)
            .padding(.vertical, .defaultSmallContentPadding)
            .background(Color.theme.background200)
            .cornerRadius(.defaultCornerRadius, corners: [.bottomLeft])
    }
    
    private var countryTextContainer: some View {
        VStack(alignment: .leading) {
            Text(String.countryTitle.uppercased())
                .foregroundStyle(Color.theme.textAccent)
                .font(.system(.caption2, design: .serif).weight(.heavy))
            
            Text(countryName)
                .foregroundStyle(Color.theme.textPrimary)
                .font(.system(.body, design: .serif).weight(.heavy))
        }
        .maxWidth(.infinity, alignment: .leading)
        .padding(.leading, .defaultPadding)
        .padding(.vertical, .defaultSmallContentPadding)
        .background(Color.theme.background200)
        .cornerRadius(.defaultCornerRadius, corners: [.bottomRight])
    }
}

struct FlagCardView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        FlagCardView(
            country: .demoCountry,
            namespaceId: animation
        )
        .padding(.horizontal, .defaultPadding)
        .maxHeight(.infinity)
        .maxWidth(.infinity)
        .background(Color.theme.background100)
    }
}

fileprivate extension String {
    static let flagFolderRef: String = "Flags/"
}

