//
//  CustomRoundedCornerShape.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 02/11/21.
//

import SwiftUI

struct RoundedCornersShape: Shape {

    let corners: UIRectCorner
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }

}
