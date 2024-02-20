//
//  WinLoseByBookmakersView.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import Foundation
import SwiftUI

fileprivate struct Appearance {
    let boldFont: Font = .system(size: 12).bold()
    let borderColor: Color = .black
    let backgroungColor: Color = .white
}

struct WinLoseByBookmakersView: View {
    
    fileprivate let appearance = Appearance()
    let incomingDataWinningsLossesByBookmakers: IncomingDataWinningsLossesByBookmakers
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Выигрыши/проигрыши по букмекерам") // Надо сделать менеджер локализаций, но это вне рамок ТЗ
                    .font(.system(size: 14)).bold()
                
                HStack {
                    Image("williamHill")
                        .resizable()
                        .frame(width: 100, height: 50, alignment: .leading)
                    Text(String(Int(incomingDataWinningsLossesByBookmakers.totalBets)) + " ставки")
                        .font(.system(size: 14)).bold()
                }
                
                HStack {
                    HStack(spacing: 4) {
                        VStack(alignment: .leading) {
                            WinningLossesBarView(color: .green, percentage: incomingDataWinningsLossesByBookmakers.percentageForView.winning)
                            Text(String(Int(incomingDataWinningsLossesByBookmakers.winning)) + "(\(Int(incomingDataWinningsLossesByBookmakers.percentageForView.winning))%)")
                                .font(appearance.boldFont)
                        }
                        VStack(alignment: .leading) {
                            WinningLossesBarView(color: .red, percentage: incomingDataWinningsLossesByBookmakers.percentageForView.losses)
                            Text(String(Int(incomingDataWinningsLossesByBookmakers.losses)) + "(\(Int(incomingDataWinningsLossesByBookmakers.percentageForView.losses))%)")
                                .font(appearance.boldFont)
                        }
                        
                        VStack(alignment: .trailing) {
                            WinningLossesBarView(color: .gray, percentage: incomingDataWinningsLossesByBookmakers.percentageForView.refund)
                            Text(String(Int(incomingDataWinningsLossesByBookmakers.refund)) + "(\(100 - Int(incomingDataWinningsLossesByBookmakers.percentageForView.winning + incomingDataWinningsLossesByBookmakers.percentageForView.losses))%)")
                                .font(appearance.boldFont)
                        }
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
    WinLoseByBookmakersView(
        incomingDataWinningsLossesByBookmakers: IncomingDataWinningsLossesByBookmakers(
            totalBets: 32,
            winning: 16,
            losses: 11,
            refund: 5
        )
    )
}
