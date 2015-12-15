//
//  Double+Extension.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

extension Double {
    
    static func getRandom(Min _Min : Double, Max _Max : Double)->Double {
        return ( Double(arc4random_uniform(UINT32_MAX)) / Double(UINT32_MAX) ) * (_Max - _Min) + _Min
    }
    
    func shake(shakeRate shakeRate: Double) -> Double {
        return Double.getRandom(Min: self * (1 - shakeRate), Max: self * (1 + shakeRate))
    }
    
}
