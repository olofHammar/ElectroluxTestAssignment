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
    private let onTap: (() -> Void)?
    
    init(
        country: CountryItem,
        namespaceId: Namespace.ID,
        onTap: (() -> Void)? = nil
    ) {
        self.countryId = country.id
        self.countryName = country.name
        self.imageString = country.flagImageString
        self.namespaceId = namespaceId
        self.onTap = onTap
    }
    var body: some View {
        cardContainer
            .onTapGesture(perform: { onTap?() })
    }
    
    private var cardContainer: some View {
        VStack(spacing: 4) {
            imageContainer
            
            bottomRowContainer
        }
        .matchedGeometryEffect(id: countryId, in: namespaceId)
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
        Image(systemName: "globe.europe.africa.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .height(.defaultIconHeight)
            .fontWeight(.light)
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
                .caption2Heavy()
            
            Text(countryName)
                .foregroundStyle(Color.theme.textPrimary)
                .bodyHeavy()
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

