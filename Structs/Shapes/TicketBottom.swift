//
//  TicketBottom.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct TicketBottom: Shape {
    
    var cornerRadius: CGFloat
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
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        
        // Right Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        ) // -> path-addArc
        
        // Bottom Line
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        
        // Left Bottom Corner
        path.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cutRadius),
            radius: cutRadius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
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
