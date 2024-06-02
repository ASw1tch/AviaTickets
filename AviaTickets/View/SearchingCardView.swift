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
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            scrollCardView()

        }
            }
    
    @ViewBuilder
    func scrollCardView() -> some View {
        Image(image)
            .resizable()
            .frame(width: 130, height: 130)
    }
}

#Preview {
    SearchingCardView()
}
