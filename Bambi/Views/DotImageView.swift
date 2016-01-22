//
//  DotImageView.swift
//  Bambi
//
//  Created by Azure Chen on 2016/1/17.
//  Copyright © 2016年 WednesdayCC. All rights reserved.
//

import UIKit

class DotImageView: UIView {
    
    var image: UIImage?
    var imagePixels: UnsafePointer<UInt8>?
    let xDotNumber = 35
    
    override func drawRect(rect: CGRect) {
        if image == nil {
            return
        }
        
        let yDotNumber = Int(CGFloat(xDotNumber) * rect.height / rect.width)
        for y in 0 ..< yDotNumber {
            for x in 0 ..< xDotNumber {
                let xImagePos = self.image!.size.width * CGFloat(x) / CGFloat(xDotNumber) + self.image!.size.width / CGFloat(xDotNumber) / 2
                let yImagePos = self.image!.size.height * CGFloat(y) / CGFloat(yDotNumber) + self.image!.size.height / CGFloat(yDotNumber) / 2
                let dotSize = rect.width * 3 / CGFloat(xDotNumber) / 4
                let xDotPos = rect.width * CGFloat(x) / CGFloat(xDotNumber) + rect.width / CGFloat(xDotNumber) / 2 - dotSize / 2
                let yDotPos = rect.height * CGFloat(y) / CGFloat(yDotNumber) + rect.height / CGFloat(yDotNumber) / 2 - dotSize / 2
                
                let color = getPixelColor(CGPointMake(CGFloat(xImagePos), CGFloat(yImagePos)))
                let path = UIBezierPath(ovalInRect: CGRectMake(xDotPos, yDotPos, dotSize, dotSize))
                color!.setFill()
                path.fill()
                
            }
        }
    }
    
    func setDotImage(image: UIImage?) {
        if image == nil {
            return
        }
        self.image = image
        let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image!.CGImage))
        imagePixels = CFDataGetBytePtr(pixelData)
    }
    
    func getPixelColor(pos: CGPoint) -> UIColor? {
        if image == nil {
            return nil
        }
        
        let pixelIndex = ((Int(self.image!.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(imagePixels![pixelIndex]) / CGFloat(255.0)
        let g = CGFloat(imagePixels![pixelIndex + 1]) / CGFloat(255.0)
        let b = CGFloat(imagePixels![pixelIndex + 2]) / CGFloat(255.0)
        let a = CGFloat(imagePixels![pixelIndex + 3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}
