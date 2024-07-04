//
//  SubscriptionsView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import SwiftUI

struct SubscriptionsView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Subscriptions")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    SubscriptionsView()
}
