//
//  BarViewAvgCoefficient.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import Foundation
import SwiftUI

fileprivate struct Appearance {
    let barHeight: CGFloat = 10
    let cornerRadius: CGFloat = 2
    let grayColor: Color = .gray.opacity(0.5)
    let grayTextColor: Color = .gray
}

struct AvgCoefficientBarView: View {
    var color: Color
    var totalWidth: Double
    let percentage: Double
    let mainBarPercent: Double
    fileprivate let appearance = Appearance()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(appearance.grayColor)
                .frame(width: totalWidth, height: appearance.barHeight)
            Rectangle()
                .fill(color)
                .frame(width: min((percentage / 100) * totalWidth, totalWidth), height: appearance.barHeight)
                .cornerRadius(appearance.cornerRadius)
        }
        .cornerRadius(appearance.cornerRadius)
    }
    init(color: Color, totalWidth: Double = 200.0, percentage: Double) {
        self.color = color
        self.totalWidth = totalWidth
        self.percentage = percentage
        self.mainBarPercent = (percentage / 100) * totalWidth
    }
}
