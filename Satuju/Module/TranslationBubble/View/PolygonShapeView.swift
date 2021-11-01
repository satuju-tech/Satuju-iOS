//
//  PolygonShapeView.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 29/10/21.
//

import SwiftUI

struct PolygonShapeView: View {
    var body: some View {
        Polygon()
            .frame(width: 8, height: 16)
            .padding(.bottom, 24)
            .foregroundColor(.white)
    }
}

struct Polygon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.08402 * width, y: 0.59343 * height))
        path.addCurve(
            to: CGPoint(x: 0.08402 * width, y: 0.40657 * height),
            control1: CGPoint(x: -0.02801 * width, y: 0.5437 * height),
            control2: CGPoint(x: -0.02801 * width, y: 0.4563 * height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0.08402 * width, y: 0.59343 * height))
        path.closeSubpath()
        return path
    }
}

struct PolygonShapeView_Previews: PreviewProvider {
    static var previews: some View {
        PolygonShapeView()
            .previewLayout(.sizeThatFits)
    }
}
