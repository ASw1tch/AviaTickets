//
//  SearchResultView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import SwiftUI

struct SearchResultView: View {
    @ObservedObject var coordinator: MainCoordinator
    
    @Binding var flightFrom: String
    @Binding var flightTo: String
    
    @State private var ticketsOffers: [TicketsOffer] = []
    @State private var selectedDate = Date()
    @State private var returnDate: Date? = nil
    @State private var isDatePickerPresented = false
    @State private var isOn = false
    @StateObject private var viewModel = OfferTicketsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                VStack {
                    searchCardView()
                    ScrollView(.horizontal) {
                        HStack {
                            returnDatePickerCapsule()
                            datePickerCapsule()
                            personAndClassCapsule()
                            filtersCapsule()
                        }.padding(.horizontal, 15)
                            
                    }
                    .scrollIndicators(.hidden)
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.aviaGrey2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 350)
                            .padding(.horizontal, 10)
                            .shadow(radius: 2, y: 3)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Прямые рейсы")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 28)
                            
                            ForEach(Array(viewModel.ticketsOffers.prefix(3).enumerated()), id: \.element.id) { index, offer in
                                ticketsRow(content: offer, index: index)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                            }
                            
                        }
                        
                    }.padding(.vertical, 15)
                    Button(action: {
                        let allTicketsView = AllTicketsView(
                            coordinator: coordinator,
                            flightFrom: $flightFrom,
                            flightTo: $flightTo,
                            selectedDate: $selectedDate
                        )
                        coordinator.push(allTicketsView)
                    }) {
                        Text("Посмотреть все билеты")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                        
                    }.padding(.horizontal, 10)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.aviaGrey2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .padding(.horizontal, 10)
                            
                        HStack{
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 20, height: 25)
                                .foregroundStyle(isOn == false ? .blue : .green)
                                
                            Text("Подписка на цену")
                            Spacer()
                            Toggle(isOn: $isOn) {
                                
                            }
                        }.padding(.horizontal, 20)

                    }.padding(.vertical, 15)
                    Spacer()
                }
            }
            .sheet(isPresented: $coordinator.isDatePickerPresented) {
                VStack {
                    DatePicker(
                        "Выберите дату",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    
                    Button("Выбрать") {
                        
                        coordinator.isDatePickerPresented = false
                    }
                    .buttonStyle(GreenButtonStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .sheet(isPresented: $coordinator.isReturnDatePickerPresented) {
                VStack {
                    DatePicker(
                        "Выберите дату",
                        selection: Binding($coordinator.selectedReturnDate, default: Date()),
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    
                    Button("Выбрать") {
                        if let returnDate = coordinator.selectedReturnDate {
                            self.returnDate = returnDate
                        }
                        coordinator.isReturnDatePickerPresented = false
                    }
                    .buttonStyle(GreenButtonStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            

            .onAppear {
                viewModel.fetchOfferTickets()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
    @ViewBuilder
    func searchCardView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.aviaGrey4)
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .padding(.horizontal, 10)
                
            
            HStack(alignment: .center) {
                Image("leftArrow")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(Color.aviaGrey7)
                    .onTapGesture {
                        coordinator.pop()
                    }
                VStack(alignment: .leading, spacing: 15){
                    
                    HStack {
                        TextField("",
                                  text: $flightFrom,
                                  prompt: Text("Куда - Турция")
                            .foregroundStyle(Color.aviaGrey6))
                        
                        .accentColor(.white)
                        Button(action: {
                            let temp = flightFrom
                            flightFrom = flightTo
                            flightTo = temp
                        }, label: {
                            Image("arrows")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                                .foregroundStyle(Color.aviaGrey7)
                        })
                        
                    }   .bold()
                        .padding(.trailing, 50)
                        .foregroundStyle(.white)
                    
                    Rectangle()
                        .fill(Color.aviaGrey5)
                        .padding(.trailing)
                        .frame(height: 1)
                        .frame(width: 310)
                    
                    HStack {
                        TextField("",
                                  text: $flightTo,
                                  prompt: Text("Куда - Турция")
                            .foregroundStyle(Color.aviaGrey6))
                        
                        Button(action: {
                            flightTo = ""
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
            }.offset(x: 20)
        }.padding(5)
        
    }
    
    @ViewBuilder
    func datePickerCapsule() -> some View {
        ZStack {
            Capsule()
                .fill(Color.aviaGrey4)
                .frame(width: 120)
                .frame(height: 40)
            HStack(spacing: 0) {
                Text(formattedDate(date: selectedDate))
                    .foregroundStyle(.white)
                Text(", \(formattedWeekday(date: selectedDate))")
                    .foregroundStyle(Color.aviaGrey6)
            }.font(.body)
        }.onTapGesture {
            coordinator.showDatePicker(selectedDate: $selectedDate)
        }
    }
    
    @ViewBuilder
    func returnDatePickerCapsule() -> some View {
        ZStack {
            Capsule()
                .fill(Color.aviaGrey4)
                .frame(width: 120)
                .frame(height: 40)
            HStack(spacing: 10) {
                if let returnDate = returnDate {
                    Text(formattedDate(date: returnDate))
                        .foregroundStyle(.white)
                    Text(", \(formattedWeekday(date: returnDate))")
                        .foregroundStyle(Color.aviaGrey6)
                } else {
                    Image("plusSign")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.aviaGrey6)
                    Text("обратно")
                        .foregroundStyle(.white)
                }
            }
            .font(.body)
        }
        .onTapGesture {
            coordinator.showReturnDatePicker(selectedDate: $returnDate)
        }
    }
    
    struct GreenButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green))
                .foregroundColor(.white)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        }
    }
    
    @ViewBuilder
    func personAndClassCapsule() -> some View {
        ZStack {
            Capsule()
                .fill(Color.aviaGrey4)
                .frame(width: 120)
                .frame(height: 40)
            HStack(spacing: 0) {
                Image("person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.aviaGrey6)
                Text(" 1")
                    .foregroundStyle(.white)
                Text(", эконом")
                    .foregroundStyle(.white)
            }.font(.body)
        }.onTapGesture {
            
        }
    }
    
    @ViewBuilder
    func filtersCapsule() -> some View {
        ZStack {
            Capsule()
                .fill(Color.aviaGrey4)
                .frame(width: 120)
                .frame(height: 40)
            HStack(spacing: 10) {
                Image("filter")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.aviaGrey6)
                Text("Фильтры")
                    .foregroundStyle(.white)
            }.font(.body)
        }.onTapGesture {
            
        }
    }
    
    @ViewBuilder
    func ticketsRow(content: TicketsOffer, index: Int) -> some View {
        let colors: [Color] = [.aviaRed, .aviaBlue, .white]
        let circleColor = colors[index % colors.count]
        
        FlightsCardView(circleColor: circleColor,
                        timeOfFlights: content.timeRange,
                        price: content.price.value,
                        carrier: content.title)
       
    }
    
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
    
    func formattedWeekday(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
}

extension Binding {
    init(_ source: Binding<Value?>, default defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { newValue in source.wrappedValue = newValue }
        )
    }
}

struct SearchResultView_Previews: PreviewProvider {
    @State static var flightFrom = "Москва"
    @State static var flightTo = "Санкт-Петербург"
    
    static var previews: some View {
        SearchResultView(coordinator: MainCoordinator(), flightFrom: $flightFrom, flightTo: $flightTo)
    }
}

