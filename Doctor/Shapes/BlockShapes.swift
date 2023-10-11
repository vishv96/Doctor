//
//  backshape.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct BlockShapes: View {
    var body: some View {
        VStack(spacing: 40) {
            Block()
                .stroke(.accent, style: .init(lineWidth: 12, lineCap: .round, lineJoin: .round))
            Block()
                .stroke(.accent, style: .init(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(180))
                
        }
        .padding()
        .opacity(0.1)
        .rotationEffect(.degrees(30))
    }
}

struct Block: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY - 80))
        
        path.addLine(to: .init(x: rect.midX - 20 , y: rect.maxY - 80))
        path.addLine(to: .init(x: rect.midX - 20, y: rect.maxY - 180))
        path.addLine(to: .init(x: rect.midX + 100 , y: rect.maxY - 180))
        
        path.addLine(to: .init(x: rect.midX + 100 , y: rect.maxY - 80))
        path.addLine(to: .init(x: rect.maxX , y: rect.maxY - 80))
        
        path.addLine(to: .init(x: rect.maxX , y: rect.maxY ))
        path.addLine(to: .init(x: rect.minX , y: rect.maxY ))
        return path
    }
    
}

#Preview {
    BlockShapes()
}
