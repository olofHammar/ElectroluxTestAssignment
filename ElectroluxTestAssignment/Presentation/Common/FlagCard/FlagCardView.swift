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
        VStack(alignment: .leading, spacing: 0) {
            imageContainer
            
            titleContainer
        }
    }
    
    private var imageContainer: some View {
        Image(String.flagFolderRef + imageString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .height(.defaultFlagHeight)
    }
    
    private var titleContainer: some View {
        Text(countryName)
            .foregroundStyle(Color.theme.textPrimary)
            .font(.system(.title, design: .serif).weight(.heavy).italic())
    }
}

struct FlagCardView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        FlagCardView(
            country: .demoCountry,
            namespaceId: animation
        )
        .maxHeight(.infinity)
        .background(Color.theme.background100)
    }
}

fileprivate extension String {
    static let flagFolderRef: String = "Flags/"
}
