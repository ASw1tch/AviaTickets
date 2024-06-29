//
//  WeekendView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 27.6.24..
//

import SwiftUI

struct WeekendView: View {
    var body: some View {        
        ZStack {
        Color(.black).edgesIgnoringSafeArea(.all)
        Text("На выходные")
            .foregroundStyle(.white)
            .bold()
        }
    }
}

#Preview {
    WeekendView()
}
