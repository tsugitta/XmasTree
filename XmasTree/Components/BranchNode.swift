//
//  BranchNode.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SceneKit

class BranchNode: SCNNode {
    
    let length: CGFloat // 枝の長さ
    let radius: CGFloat = 0.08 // 枝の半径
    let numberOfLeavesInLeafCircle = 8 // 円状に広がる葉群の数
    let intervalLeafCircle: Float = 2 // 葉群の間隔
    let leafLength: Float = 3
    let leafAngle = Float(M_PI_4) // 葉の枝方向からの角度
    
    init(length: CGFloat) {
        self.length = length
        super.init()
        geometry = SCNCone(topRadius: radius, bottomRadius: radius, height: length)
        geometry!.firstMaterial?.diffuse.contents = UIColor.branchBrownColor()
        
        createLeaves()
    }

    private func createLeaves() {
        let floatBranchLength = Float(length)
        let numberOfLeafCircles = Int(floatBranchLength / intervalLeafCircle)

        for i in 1...numberOfLeafCircles {
            let leafCircleHeight = floatBranchLength - Float(i - 1) * intervalLeafCircle
            
            for j in 1...numberOfLeavesInLeafCircle {
                let leafNode = LeafNode(length: CGFloat(leafLength))
                let angleZX = Double(j) * 2 * M_PI / Double(numberOfLeavesInLeafCircle)
                leafNode.pivot = SCNMatrix4MakeTranslation(0, -leafLength / 2, 0)
                leafNode.position = SCNVector3(0, leafCircleHeight - floatBranchLength / 2, 0)
                leafNode.rotation = SCNVector4.makeRoughly(sin(angleZX), 0, cos(angleZX), Double(leafAngle))
                
                addChildNode(leafNode)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
