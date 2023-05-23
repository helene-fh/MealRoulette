//
//  ContentViewModel.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-02.
//

import Combine
import SwiftUI

class ContentViewModel: ObservableObject {
    
     var data: MealResponse?
     var limitData: MealLimitResponse?
   
     @Published var meals: [MealModel] = []
     @Published var details : MealDetailsModel?
     @Published var limit : Nodes?

    private var cancellable: AnyCancellable?
    
    func fetchData(){
        guard let url = URL(string: Constants.baseURL) else {
            print("Invalid URL")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                case .finished:
                    print("Data fetched successfully")
                }
            } receiveValue: { data in
                self.data = data
                self.meals = data.meals
            }
    }
    
    func fetchMealDetails(mealId: Int){
        guard let url = URL(string: "\(Constants.baseURL)/\(mealId)") else {
            print("Invalid URL")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealDetailResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                case .finished:
                    print("Data fetched successfully")
                }
            } receiveValue: { data in
                self.details = data.mealDetails
            }
    }
    
    func fetchFourMeals(index: Int){
        guard let url = URL(string: "\(Constants.baseURL)/limit/4/offset/\(index)") else {
            print("Invalid URL")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealLimitResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                case .finished:
                    print("Data fetched successfully")
                }
            } receiveValue: { data in
                self.limitData = data
                self.meals = data.mealLimit.nodes
                print(self.meals)
            }
    }
}
