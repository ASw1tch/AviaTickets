//
//  AviaView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.5.24..
//

import SwiftUI

struct AviaView: View {
    var coordinator: MainCoordinator
    @State var flightFrom = ""
    @State var flightTo  = ""
    
    var body: some View {
        ZStack {
            Color.black
            VStack(alignment: .leading) {
                Text("Поиск дешевых авиaбилетов")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                searchCardView()
                VStack{
                    Text("Музыкально отлететь")
                        .foregroundStyle(.white)
                        .font(.title)
                        .padding()
                        .bold()

                }
                ScrollView(.horizontal) {
                    
                    HStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 180, height: 200)
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 180, height: 200)
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 180, height: 200)
                    }
                }
                
            }
        }.ignoresSafeArea()
    }
    
    @ViewBuilder
    func searchCardView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.aviaGrey3)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.aviaGrey4)
                .frame(height: 110)
                .padding(.horizontal, 20)
                .shadow(color: Color.black.opacity(0.2), radius: 2, y: 5)
            HStack(alignment: .center, spacing: 20) {
                Image("search")
                    .resizable()
                    .frame(width: 35.0, height: 35.0)
                    .foregroundStyle(Color.aviaGrey7)
                
                VStack(alignment: .leading, spacing: 15){
                    TextField("",
                              text: $flightFrom,
                              prompt: Text("Откуда - Москва")
                        .foregroundStyle(Color.aviaGrey6))
                    
                    Rectangle()
                        .fill(Color.gray)
                        .padding(.trailing)
                        .frame(height: 1)
                        .frame(width: 250)
                    
                    TextField("",
                              text: $flightTo,
                              prompt: Text("Куда - Турция")
                        .foregroundStyle(Color.aviaGrey6))
                    
                }.bold()
                    .foregroundStyle(.white)
            }.offset(x: 30)
            
        }.padding(15)
        
    }
    
}

#Preview {
    AviaView(coordinator: MainCoordinator())
}
