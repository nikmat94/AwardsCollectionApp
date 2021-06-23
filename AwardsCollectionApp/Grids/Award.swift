//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 21.06.2021.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(
                awardView: AnyView(GradientRectangles(width: 100, height: 100)),
                title: "Gradient Rectangles",
                awarded: true
            ),
            Award(
                awardView: AnyView(PathView(width: 100, height: 100)),
                title: "Path View",
                awarded: true
            ),
            Award(
                awardView: AnyView(CurvesView(width: 100, height: 100)),
                title: "Curves View",
                awarded: true
            ),
            Award(
                awardView: AnyView(HypocycloidView(width: 100, height: 100, showSliders: false)),
                title: "Hypocycloid View",
                awarded: false
            )
        ]
    }
}
