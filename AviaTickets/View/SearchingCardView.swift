//
//  SearchingCardView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.6.24..
//

import SwiftUI

struct SearchingCardView: View {
    
    @State var flightFrom = ""
    @State var flightTo  = ""
    let image = "dieAntwood"
    let title = "Die Antwoord"
    let town = "Будапешт"
    let priceValue = "5 000"
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            scrollCardView()

        }
            }
    
    @ViewBuilder
    func scrollCardView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(16)
                
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
            Text(town)
                .font(.subheadline)
                .foregroundStyle(.white)
            HStack {
                Image("planeMain")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(Color.aviaGrey7)
                Text("от \(priceValue) ₽")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SearchingCardView()
}
