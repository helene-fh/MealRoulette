//
//  RefreshButton.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-04-30.
//

import SwiftUI

struct RefreshButton: View {
    
    var title = "Refresh"
    
    var body: some View {
        Text(title)
            .frame(width:100, height: 100)
            .background(.green)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(Circle())
            .padding(10)
    }
}
