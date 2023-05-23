//
//  DetailsView.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-02.
//

import SwiftUI

struct Details: View {
    
    let meal : MealModel
    @StateObject private var viewModel = ContentViewModel()
    
    var body : some View {
        VStack {
            if let details = viewModel.details {
                DetailsCard(details: details)
            } else {
                Text("Details is not available")
            }
        }
        .onAppear {
            viewModel.fetchMealDetails(mealId: meal.id)
        }
    }
}
