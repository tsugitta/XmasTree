//
//  SCNVector4+Extension.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SceneKit

extension SCNVector4 {
    
    static let shakeRate: Double = 0.1
    
    static func makeRoughly(x: Double, _  y: Double, _ z: Double, _ w: Double) -> SCNVector4 {
        let newX = x.shake(shakeRate: shakeRate)
        let newY = y.shake(shakeRate: shakeRate)
        let newZ = z.shake(shakeRate: shakeRate)
        let newW = w.shake(shakeRate: shakeRate)
        return SCNVector4(newX, newY, newZ, newW)
    }
    
}
