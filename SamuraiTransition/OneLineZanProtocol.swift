//
//  OneLineZanProtocol.swift
//  SamuraiTransition
//
//  Created by Nishinobu.Takahiro on 2016/12/07.
//  Copyright © 2016年 hachinobu. All rights reserved.
//

import Foundation

public protocol OneLineZanProtocol {
    
    func oneSideBezierPath(containerFrame: CGRect, zanPoint: CGPoint, bottomX: CGFloat) -> UIBezierPath
    func otherSideBezierPath(containerFrame: CGRect, zanPoint: CGPoint, bottomX: CGFloat) -> UIBezierPath
    func zanLineLayer(from start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) -> CAShapeLayer
    
}

public extension OneLineZanProtocol {
    
    func oneSideBezierPath(containerFrame: CGRect, zanPoint: CGPoint, bottomX: CGFloat) -> UIBezierPath {
        
        let oneSidePath = UIBezierPath()
        oneSidePath.move(to: CGPoint(x: containerFrame.maxX, y: containerFrame.minY))
        oneSidePath.addLine(to: zanPoint)
        oneSidePath.addLine(to: CGPoint(x: bottomX, y: containerFrame.maxY))
        oneSidePath.addLine(to: CGPoint(x: containerFrame.maxX, y: containerFrame.maxY))
        oneSidePath.addLine(to: CGPoint(x: containerFrame.maxX, y: containerFrame.minY))
        oneSidePath.close()
        
        return oneSidePath
    }
    
    func otherSideBezierPath(containerFrame: CGRect, zanPoint: CGPoint, bottomX: CGFloat) -> UIBezierPath {
        
        let otherSidePath = UIBezierPath()
        otherSidePath.move(to: CGPoint(x: containerFrame.minX, y: containerFrame.minY))
        otherSidePath.addLine(to: CGPoint(x: containerFrame.maxX, y: containerFrame.minY))
        otherSidePath.addLine(to: CGPoint(x: bottomX, y: containerFrame.maxY))
        otherSidePath.addLine(to: CGPoint(x: containerFrame.minX, y: containerFrame.maxY))
        otherSidePath.addLine(to: CGPoint(x: containerFrame.minX, y: containerFrame.minY))
        otherSidePath.close()
        
        return otherSidePath
    }
    
    func zanLineLayer(from start: CGPoint, end: CGPoint, width: CGFloat, color: UIColor) -> CAShapeLayer {
        
        let zanLineLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        zanLineLayer.path = path.cgPath
        zanLineLayer.fillColor = nil
        zanLineLayer.strokeColor = color.cgColor
        zanLineLayer.lineWidth = width
        return zanLineLayer
        
    }
    
}