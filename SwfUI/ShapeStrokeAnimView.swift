//
//  ShapeStrokeAnimView.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/09.
//

import SwiftUI

struct ShapeStrokeAnimView: View {
    @State private var completionAmount: CGFloat = 0.0
    private enum Shapes: String, CaseIterable, Equatable {
        case Circle = "circle"
        case Rect = "rect"
    }
    @State private var shpaeType: Shapes = Shapes.Circle
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    fileprivate func drawCircle() -> some View {
        return Circle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.gray, lineWidth: 15)
            .frame(width: 150, height: 150, alignment: .center)
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount > 1.0 {
                        completionAmount = 0.0
                    } else {
                        completionAmount += 0.2
                    }
                }
            }
    }
    
    fileprivate func drawRect() -> some View {
        return Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.gray, lineWidth:15)
            .rotationEffect(.degrees(-90))
            .frame(width: 150, height: 150, alignment: .center)
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount > 1.0 {
                        completionAmount = 0.0
                    } else {
                        completionAmount += 0.2
                    }
                }
            }
    }
    
    var body: some View {
        Section {
            VStack {
                Picker("Choose drawing shape", selection: $shpaeType) {
                    ForEach(ShapeStrokeAnimView.Shapes.allCases, id:\.self) { type in
                        Text(type.rawValue)
                    }
                }
                .padding()
                if shpaeType == .Circle {
                    drawCircle()
                } else if shpaeType == .Rect {
                    drawRect()
                }
            }
        }
        .pickerStyle(.segmented)
    }
}

struct ShapeStrokeAnimView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeStrokeAnimView()
    }
}
