//
//  IncomingData.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import Foundation

struct IncomingDataAverageCoefficients {
    let winning: Double
    let losses: Double
    let refund: Double
    public let percentageForView: (win: Double, lose: Double, refund: Double)
    
    private static func calculatePercentageForView(winning: Double, losses: Double, refund: Double) -> (win: Double, lose: Double, refund: Double){
        ((winning / 3) * 100, (losses / 3) * 100, (refund / 3) * 100)
    }
    init(winning: Double, losses: Double, refund: Double) {
        self.winning = winning
        self.losses = losses
        self.refund = refund
        
        self.percentageForView = IncomingDataAverageCoefficients.calculatePercentageForView(winning: winning, losses: losses, refund: refund)
    }
}

struct IncomingDataWinningsLossesByBookmakers {
    
    let totalBets: Double
    let winning: Double
    let losses: Double
    let refund: Double
    
    let percentageForView: (winning: Double, losses: Double, refund: Double)
    
    private static func calculatePercentageForView(winning: Double, losses: Double, refund: Double, totalBets: Double) -> (winning: Double, losses: Double, refund: Double){
            ((winning / totalBets) * 100, (losses / totalBets) * 100, (refund / totalBets) * 100)
        }
    
    init(totalBets: Double, winning: Double, losses: Double, refund: Double) {
        self.totalBets = totalBets
        self.winning = winning
        self.losses = losses
        self.refund = refund
        
        self.percentageForView = IncomingDataWinningsLossesByBookmakers.calculatePercentageForView(
            winning: winning,
            losses: losses,
            refund: refund,
            totalBets: totalBets
        )
    }
}
