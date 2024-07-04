//
//  ShortlyView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import SwiftUI

struct ShortlyView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Short")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    ShortlyView()
}
