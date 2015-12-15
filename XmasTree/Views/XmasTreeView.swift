//
//  XmasTreeView.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SceneKit

class XmasTreeView: SCNView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scene = SCNScene()
        createSpotLight()
        createAmbientLight()
        createCameraNode()
        createGround()
        createTreeNode()
        
        allowsCameraControl = true
        backgroundColor = UIColor.darkGrayColor()
    }
    
    func createSpotLight() {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeSpot
        lightNode.position = SCNVector3(x: 0, y: 100, z: 0)
        lightNode.rotation = SCNVector4(1, 0, 0, -M_PI / 2.0)
        lightNode.name = "spotLight"
        scene!.rootNode.addChildNode(lightNode)
    }
    
    func createAmbientLight() {
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.lightGrayColor()
        scene!.rootNode.addChildNode(ambientLightNode)
    }
    
    func createCameraNode() {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 70, z: 40)
        cameraNode.rotation = SCNVector4(1, 0, 0, -0.8)
        scene!.rootNode.addChildNode(cameraNode)
    }
    
    func createGround() {
        let floorGround = SCNFloor()
        floorGround.firstMaterial?.diffuse.contents = UIColor.leafGreenColor()
        let floorNode = SCNNode()
        floorNode.geometry = floorGround
        floorNode.position = SCNVector3Make(0, 0, 0)
        scene!.rootNode.addChildNode(floorNode)
    }
    
    func createTreeNode() {
        let treeNode = TreeNode()
        scene!.rootNode.addChildNode(treeNode)
    }

}
