//
//  CardImageStore.swift
//  Pods
//
//  Created by Christopher Jones on 3/24/16.
//
//

import UIKit

/// Defines a store that will return an image for a specific card type.
public protocol CardTypeImageStore {

    /**
     Provides an image for a specific card type. These images will be shown in a `CardTextField` once the card type has been detected from the entered number.
     
     - parameter cardType: The card type whose image should be retreived.
     
     - returns: The image for the specified card type or nil, if no image was provided for this card type.
     */
    func imageForCardType(cardType: CardType) -> UIImage?
    
    /**
     Provides an image for the CVC of a specific card type. The position of a CVC on a card may vary based on the card issuer, so that different card types may provide different images to indicate the location of the CVC on the card. This image will be shown in a `CardTextField`'s image view once the user starts entering the CVC.
     
     - parameter cardType: The card type whose CVC image should be retreived.
     
     - returns: The image for the CVC of the specified card type or nil, if no image was provided for this card type.
     */
    func cvcImageForCardType(cardType: CardType) -> UIImage?

}

extension NSBundle: CardTypeImageStore {
    
    public func imageForCardType(cardType: CardType) -> UIImage? {
        return UIImage(named: cardType.name, inBundle: self, compatibleWithTraitCollection: nil)
    }

    public func cvcImageForCardType(cardType: CardType) -> UIImage? {
        let cvcImageName: String
        if cardType.isEqualTo(AmericanExpress()) {
            cvcImageName = "AmexCVC"
        } else {
            cvcImageName = "CVC"
        }
        
        return UIImage(named: cvcImageName, inBundle: self, compatibleWithTraitCollection: nil)
    }

}
