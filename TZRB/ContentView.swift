//
//  ContentView.swift
//  TZRB
//
//  Created by Дмитрий Гусев on 20.02.24.
//

import SwiftUI



struct ContentView: View {

    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            AverageCoefficientsView(
                incomingDataAverageCoefficients: IncomingDataAverageCoefficients(
                    winning: 1.94,
                    losses: 2.17,
                    refund: 1.26
                )
            )
            .padding()
            .frame(width: 400, alignment: .center)
            
            WinLoseByBookmakersView(
                incomingDataWinningsLossesByBookmakers: IncomingDataWinningsLossesByBookmakers(
                    totalBets: 32,
                    winning: 16,
                    losses: 11,
                    refund: 5
                )
            )
            .padding()
            .frame(width: 400, alignment: .center)
        }
    }
}
#Preview {
    ContentView()
}
