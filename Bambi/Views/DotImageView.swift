//
//  DotImageView.swift
//  Bambi
//
//  Created by Azure Chen on 2016/1/17.
//  Copyright © 2016年 WednesdayCC. All rights reserved.
//

import UIKit

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }  
}

class DotImageView: UIView {
    
    var image: UIImage?
    
    override func drawRect(rect: CGRect) {
        
        
    }
    
    func transfer() {
        if (self.image != nil) {
            for x in 0..<Int(self.image!.size.width) {
                for y in 0..<Int(self.image!.size.height) {
                    
                    let color: UIColor = self.image!.getPixelColor(CGPointMake(CGFloat(x), CGFloat(y)))
                    let components = CGColorGetComponents(color.CGColor)
                    
                    // Be careful, it will print 512*341 lines in console
                    //print("r:\(components[0]) g:\(components[1]) b:\(components[2])")
                }
            }
        }
    }
}
