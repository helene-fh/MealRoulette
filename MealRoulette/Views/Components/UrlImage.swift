//
//  UrlImageLoader.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-01.
//

import SwiftUI

struct UrlImage: View {
    let url: String
    let size: CGFloat
    @State private var image: UIImage? = nil
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image from URL: \(url.absoluteString)")
                return
            }
            
            DispatchQueue.main.async {
                image = UIImage(data: data)
            }
        }.resume()
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(url: "https://i.postimg.cc/nVYKG8qj/no-car.png", size: 180)
    }
}
