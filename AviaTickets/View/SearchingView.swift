//
//  SearchingView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 3.6.24..
//

import SwiftUI

struct SearchingView: View {
    @State var flightFrom = ""
    @State var flightTo  = ""
    
    var body: some View {
        ZStack {
            Color.aviaGrey2.ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 50)
                    .frame(height: 6)
                    .foregroundColor(Color.aviaGrey4)
                    .padding()
                Spacer()
            }
            VStack(spacing: 20) {
                searchCardView()
                HStack(alignment: .top, spacing: 25) {
                    fastButton(color: .aviaGreen, image: "route", text: "Сложный маршрут")
                    fastButton(color: .aviaBlue, image: "planet", text: "Куда угодно")
                    fastButton(color: .aviaDarkBlue, image: "calendar", text: "Выходные")
                    fastButton(color: .aviaRed, image: "fire", text: "Горячие билеты")
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.aviaGrey4)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .padding(.horizontal, 10)
                        .shadow(radius: 2, y: 3)
                    VStack {
                        suggestionCardView(city: "Стамбул", image: "istambul")
                        suggestionCardView(city: "Сочи", image: "sochi")
                        suggestionCardView(city: "Пхукет", image: "phuket")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func searchCardView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.aviaGrey4)
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .padding(.horizontal, 10)
                .shadow(radius: 2, y: 3)
            
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 15){
                    HStack {
                        Image("plane")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundStyle(Color.aviaGrey7)
                        TextField("",
                                  text: $flightFrom,
                                  prompt: Text("Откуда - Москва")
                            .foregroundStyle(Color.aviaGrey6))
                        .onChange(of: flightFrom) { oldValue, newValue in
                            let filtered = newValue.filter { $0.isCyrillic }
                            if filtered != newValue {
                                flightFrom = filtered
                            }
                        }
                    }
                    Rectangle()
                        .fill(Color.aviaGrey5)
                        .padding(.trailing)
                        .frame(height: 1)
                        .frame(width: 340)
                    HStack {
                        Image("search")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundStyle(Color.aviaGrey7)
                        TextField("",
                                  text: $flightTo,
                                  prompt: Text("Куда - Турция")
                            .foregroundStyle(Color.aviaGrey6))
                        .onChange(of: flightTo) { oldValue, newValue in
                            let filtered = newValue.filter { $0.isCyrillic }
                            if filtered != newValue {
                                flightFrom = filtered
                            }
                        }
                        Button(action: {
                            
                        }, label: {
                            Image("xMark")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                                .foregroundStyle(Color.aviaGrey7)
                        })
                        
                    }   .bold()
                        .padding(.trailing, 50)
                        .foregroundStyle(.white)
                }
            }.offset(x: 30)
        }.padding(5)
    }
    
    func fastButton(color: Color, image: String, text: String) -> some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 8).frame(width: 60, height: 60)
                    .foregroundColor(color)
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .tint(.white)
                    .bold()
            }
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
        }
    }
    
    func suggestionCardView(city: String, image: String) -> some View {
        HStack {
            VStack(alignment: .leading){
                HStack {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text(city)
                            .font(.body)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.vertical, 5)
                        Text("Популярное направление")
                            .font(.body)
                            .foregroundStyle(Color.aviaGrey5)
                    }.padding(.horizontal, 5)
                }
                Rectangle()
                    .fill(Color.aviaGrey5)
                    .frame(height: 1)
                    .frame(width: 335)
            }
        }.padding(6)
    }
}

#Preview {
    SearchingView()
}
