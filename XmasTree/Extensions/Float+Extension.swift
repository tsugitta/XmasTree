//
//  Float+Extension.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

extension Float {
    
    static func getInteriorDivision(start start: Float, end: Float, position: Int, maxPosition: Int) -> Float {
        let floatPosition = Float(position)
        let floatMaxPosition = Float(maxPosition)
        return start + (floatPosition - 1) * (end - start) / (floatMaxPosition - 1)
    }

    static func getRandom(Min _Min : Float, Max _Max : Float)->Float {
        return ( Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX) ) * (_Max - _Min) + _Min
    }
    
    func shake(shakeRate shakeRate: Float) -> Float {
        return Float.getRandom(Min: self * (1 - shakeRate), Max: self * (1 + shakeRate))
    }
    
}
