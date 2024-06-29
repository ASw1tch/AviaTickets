//
//  HotOffersView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 27.6.24..
//

import SwiftUI

struct HotOffersView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Горячие билеты")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    HotOffersView()
}
