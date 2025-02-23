//
//  TicketMiddle.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct TicketMiddle: Shape {
    
    var cutRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        // Left Upper Corner
        path.move(to: CGPoint(x: rect.minX + cutRadius, y: rect.minY))
        
        // Upper Line
        path.addLine(to: CGPoint(x: rect.maxX - cutRadius, y: rect.minY))
        
        // Right Upper Corner
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY),
            radius: cutRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: true
        ) // -> path-addArc
        
        // Right Line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Right Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - cutRadius),
            radius: cutRadius,
            startAngle: .degrees(-90),
            endAngle: .degrees(-180),
            clockwise: true
        ) // -> path-addArc
        
        // Bottom Line
        path.addLine(to: CGPoint(x: rect.minX + cutRadius, y: rect.maxY - cutRadius))
        
        // Left Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.maxY - cutRadius),
            radius: cutRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(270),
            clockwise: true
        ) // -> path-addArc
        
        // Left Line
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cutRadius))
        
        // Left Upper Corner
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.minY),
            radius: cutRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: true
        ) // -> path-addArc
        
        path.closeSubpath()
        
        return path
        
    } // -> path
    
} // -> TicketShape
