//
//  FormCompositionalLayout.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 9/9/21.
//

import Foundation
import UIKit

final class FormCompositionalLayout {
    var layout: UICollectionViewCompositionalLayout {
        // MARK: Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(16), trailing: nil, bottom: .fixed(16))
        
        // MARK: Group
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitem: layoutItem, count: 1)
        layoutGroup.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        // MARK: Section
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = .init(top: 150, leading: 0, bottom: 0, trailing: 0)
        let compLayout = UICollectionViewCompositionalLayout(section: layoutSection)
        
        return compLayout
    }
}
