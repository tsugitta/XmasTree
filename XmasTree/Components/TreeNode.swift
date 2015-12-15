//
//  TreeNode.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/14.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SceneKit

class TreeNode: SCNNode {
    
    let height: CGFloat = 45  // 幹の高さ
    let bottomRadius: CGFloat = 2  // 幹の底面の円の半径
    let ratioOfBranchZoneHeightToTreeHeight: Float = 3 / 4 // 木の高さに対する幹に枝が生えている範囲の高さ
    let numberOfBranchCircles = 12 // 円状に広がる枝群の数
    let numberOfBranchesAtBottom = 35 // 最も低い位置にある枝群が含む枝の数
    let numberOfBranchesAtTop = 6 // 最も高い〃
    let branchLengthAtBottom: Float = 16 // 最も低い位置に生えている枝の長さ
    let branchLengthAtTop: Float = 5 // 最も高い〃
    let branchAngleAtBottom = Float(M_PI_2) // 最も低い位置に生えている枝のy軸からの角度
    let branchAngleAtTop = Float(M_PI / 8) // 最も高い〃
    
    override init() {
        super.init()
        let halfHeight = Float(height / 2)
        geometry = SCNCone(topRadius: 0, bottomRadius: bottomRadius, height: height) // 円錐を適用する
        geometry!.firstMaterial?.diffuse.contents = UIColor.branchBrownColor() // 色を変える
        pivot = SCNMatrix4MakeTranslation(0, -halfHeight, 0) // ピボットを円錐の中心から、円錐の底面の中心に移動させる

        createBranches()
    }

    private func createBranches() {
        let floatTreeHeight = Float(height)
        let branchCircleHeightAtBottom = floatTreeHeight * (1 - ratioOfBranchZoneHeightToTreeHeight)
        
        for i in 1...numberOfBranchCircles {
            let branchCircleHeight = Float.getInteriorDivision(start: floatTreeHeight, end: branchCircleHeightAtBottom, position: i, maxPosition: numberOfBranchCircles)
            let numberOfBranches = Int.getInteriorDivision(start: numberOfBranchesAtTop, end: numberOfBranchesAtBottom, position: i, maxPosition: numberOfBranchCircles)
            let length = Float.getInteriorDivision(start: branchLengthAtTop, end: branchLengthAtBottom, position: i, maxPosition: numberOfBranchCircles)
            let angle = Float.getInteriorDivision(start: branchAngleAtTop, end: branchAngleAtBottom, position: i, maxPosition: numberOfBranchCircles)
            for j in 1...numberOfBranches {
                let branchNode = BranchNode(length: CGFloat(length))
                let angleZX = Double(j) * 2 * M_PI / Double(numberOfBranches)
                
                branchNode.pivot = SCNMatrix4MakeTranslation(0, -length / 2, 0)
                branchNode.position = SCNVector3(0, branchCircleHeight - floatTreeHeight / 2, 0)
                branchNode.rotation = SCNVector4.makeRoughly(sin(angleZX), 0, cos(angleZX), Double(angle))
    
                addChildNode(branchNode)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

