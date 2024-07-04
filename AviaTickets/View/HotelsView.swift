//
//  HotelsView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import SwiftUI

struct HotelsView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Hotels")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    HotelsView()
}
