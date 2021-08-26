//
//  UIImage+Extesnions.swift
//  Tamkeen
//
//  Created by bishoy on 04/02/2021.
//

import UIKit

extension UIImage {
    public func resizeToBoundingSquare(_ boundingSquareSideLength : CGFloat) -> UIImage {
        let imgScale = self.size.width > self.size.height ? boundingSquareSideLength / self.size.width : boundingSquareSideLength / self.size.height
        let newWidth = self.size.width * imgScale
        let newHeight = self.size.height * imgScale
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return resizedImage!
    }
}
