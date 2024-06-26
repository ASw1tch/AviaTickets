//
//  MultiCityRouteView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 26.6.24..
//

import SwiftUI

struct MultiCityRouteView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Куда угодно")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    MultiCityRouteView()
}
