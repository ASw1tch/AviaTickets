//
//  ProfileView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Text("Profile")
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    ProfileView()
}
