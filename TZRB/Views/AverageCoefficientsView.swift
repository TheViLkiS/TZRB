//
//  AverageCoefficientsView.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import Foundation
import SwiftUI

fileprivate struct Appearance {
    let grayColor: Color = .gray.opacity(0.5)
    let font: Font = .system(size: 12)
    let boldFont: Font = .system(size: 12).bold()
    let grayTextColor: Color = .gray
    let borderColor: Color = .black
    let backgroungColor: Color = .white
}
struct AverageCoefficientsView: View {
    
    fileprivate let appearance = Appearance()
    let incomingDataAverageCoefficients: IncomingDataAverageCoefficients
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Средние коэффициенты") // Надо сделать менеджер локализаций, но это вне рамок ТЗ
                    .font(.system(size: 14)).bold()
                
                HStack {
                    VStack(spacing: 12) {
                        AvgCoefficientBarView(color: .green, percentage: incomingDataAverageCoefficients.percentageForView.win)
                        AvgCoefficientBarView(color: .red, percentage: incomingDataAverageCoefficients.percentageForView.lose)
                        AvgCoefficientBarView(color: .gray, percentage: incomingDataAverageCoefficients.percentageForView.refund)
                    }
                    VStack(alignment: .leading, spacing: 7.8) {
                        Text("Выигрыш")
                            .font(appearance.font)
                            .foregroundColor(appearance.grayTextColor)
                        Text("Проигрыш")
                            .font(appearance.font)
                            .foregroundColor(appearance.grayTextColor)
                        Text("Возврат")
                            .font(appearance.font)
                            .foregroundColor(appearance.grayTextColor)
                    }
                    VStack(alignment: .leading, spacing: 7.8) {
                        Text(String(incomingDataAverageCoefficients.winning))
                            .font(appearance.boldFont)
                        Text(String(incomingDataAverageCoefficients.losses))
                            .font(appearance.boldFont)
                        Text(String(incomingDataAverageCoefficients.refund))
                            .font(appearance.boldFont)
                    }
                    
                }
            }
            .padding(10)
            .background(appearance.backgroungColor)
            .border(appearance.borderColor)
        }
    }
}
#Preview {
    AverageCoefficientsView(
        incomingDataAverageCoefficients: IncomingDataAverageCoefficients(
            winning: 1.94,
            losses: 2.17,
            refund: 1.26
        )
    )
}
