//
//  LottieCollectionView.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/06.
//

import SwiftUI

struct LottieCollectionView: View {
    var body: some View {
        VStack {
            HStack {
                LottieAnimationViewAdaptor(lottieFileName: "dog_car_ride")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
                LottieAnimationViewAdaptor(lottieFileName: "cactus")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            }
            HStack {
                LottieAnimationViewAdaptor(lottieFileName: "gradient_pill")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
                LottieAnimationViewAdaptor(lottieFileName: "growth")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            }
            HStack {
                LottieAnimationViewAdaptor(lottieFileName: "infinity_loader")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
                LottieAnimationViewAdaptor(lottieFileName: "loading_gradient_strokes")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            }
            HStack {
                LottieAnimationViewAdaptor(lottieFileName: "shop")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
                LottieAnimationViewAdaptor(lottieFileName: "step_loader")
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Lottie Collection")
    }
}

struct LottieListView_Previews: PreviewProvider {
    static var previews: some View {
        LottieCollectionView()
    }
}
