//
//  WinningLossesBarView.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import Foundation
import SwiftUI

fileprivate struct Appearance {
    let barHeight: CGFloat = 10
    let cornerRadius: CGFloat = 2
}

struct WinningLossesBarView: View {
    var color: Color
    var totalWidth: Double
    let percentage: Double
    let mainBarPercent: Double
    fileprivate let appearance = Appearance()
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: min((percentage / 100) * totalWidth, totalWidth), height: appearance.barHeight)
            .cornerRadius(appearance.cornerRadius)
    }
    init(color: Color, totalWidth: Double = 300, percentage: Double) {
        self.color = color
        self.totalWidth = totalWidth
        self.percentage = percentage
        self.mainBarPercent = (percentage / 100) * totalWidth
        }
}
