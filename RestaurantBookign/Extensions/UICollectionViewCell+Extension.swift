//
//  UICollectionViewCell+Extension.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 8/9/21.
//

import UIKit

extension UICollectionViewCell {
    static var cellID: String {
        String(describing: self)
    }
    
    func removeViews() {
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
