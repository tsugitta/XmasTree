//
//  Int+Extension.swift
//  XmasTree
//
//  Created by sdklt on 2015/12/15.
//  Copyright © 2015年 sdklt. All rights reserved.
//

extension Int {
    
    static func getInteriorDivision(start start: Int, end: Int, position: Int, maxPosition: Int) -> Int {
        return start + (position - 1) * (end - start) / (maxPosition - 1)
    }
    
}
