//
//  ContentView.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-04-30.
//

import SwiftUI
import Combine

struct MealSelectionView: View {
    @StateObject private var viewModel = ContentViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var currentIndex = 1
    
    private let adaptiveColums = [
        GridItem(.fixed(180)),
        GridItem(.fixed(180))
    ]
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView{
                        LazyVGrid(columns: adaptiveColums, spacing: 10) {
                            let data = viewModel.meals
                            ForEach(data) { meal in
                                ZStack{
                                    NavigationLink(destination: Details(meal: meal), label: {
                                        VStack(alignment: .center) {
                                            MealCard(meal: meal)
                                        }
                                    })
                                }
                            }
                        }
                        .padding(15)
                    }
                    Spacer()
                    VStack {
                        Divider()
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .frame(height: 2)
                        Button {
                            viewModel.fetchFourMeals(index: currentIndex)
                            currentIndex += 4
                            if currentIndex > 11 {
                                currentIndex = 0
                            }
                        } label: {
                            RefreshButton()
                        }
                    }
                    .frame(height: 80, alignment: .center)
                    .padding(.bottom, 10)
                    }
            .navigationTitle("Meals")
            .onAppear {
                viewModel.fetchFourMeals(index: currentIndex)
            }
        }
    }
}
    
struct MealSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MealSelectionView()
    }
}
