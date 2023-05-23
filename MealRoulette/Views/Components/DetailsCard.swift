//
//  DetailsCard.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-02.
//

import SwiftUI

struct DetailsCard: View {
    @Environment(\.colorScheme) var colorScheme
    let details : MealDetailsModel
    
    var body: some View {
        ScrollView{
            VStack {
                UrlImage(url: details.picture, size: 250)
                
                Text(details.title)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10).padding(.bottom, 5).padding(.top, 5)
                Text(details.description)
                Text("Ingredients")
                    .font(.title2)
                    .padding(.leading, 10).padding(.bottom, 5).padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(details.ingredients.split(separator: ","), id: \.self) { ingredient in
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .padding(.leading, 10).padding(.top, 2)
                            .font(.system(size: 5))
                       
                        Text("\(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Details")
            .padding(.leading, 10).padding(.trailing, 10)
        }
        }
}

struct DetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailsCard(details: MealDetailsModel(id: 1, title: "Pizza", picture: "https://i.postimg.cc/nVYKG8qj/no-car.png", description: "Upgrade cheesy tomato pasta with gnocchi, chorizo and mozzarella for a comforting bake that makes an excellent midweek meal", ingredients: "1 tbsp olive oil, 1 onion finely chopped, 2 garlic cloves crushed, 120g chorizo diced, 2 x 400g cans chopped tomatoes, 1 tsp caster sugar, 600g fresh gnocchi, 125g mozzarella ball cut into chunks, small bunch of basil torn, green salad to serve"))
    }
}

