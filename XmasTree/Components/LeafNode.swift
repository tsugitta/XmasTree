//
//  LeafNode.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SceneKit

class LeafNode: SCNNode {
    
    let length: CGFloat
    let radius: CGFloat = 0.1
    
    init(length: CGFloat) {
        self.length = length
        super.init()
        geometry = SCNCone(topRadius: radius, bottomRadius: radius, height: length)
        geometry!.firstMaterial?.diffuse.contents = UIColor.leafGreenColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
