//
//  AviaView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.5.24..
//

import SwiftUI

struct AviaView: View {
    @ObservedObject var coordinator: MainCoordinator
    @StateObject private var viewModel = OffersViewModel()
    
    @State var flightFrom = ""
    @State var flightTo  = ""
    @State private var offers: [Offer] = []
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
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
                            ForEach(viewModel.offers, id: \.id) { offer in
                                scrollCardView(offer: offer)
                            }
                        }
                    }.padding()
                        .scrollIndicators(.hidden)
                }
            }.ignoresSafeArea()
                .onAppear {
                    viewModel.fetchOffers()
                }
                .navigationDestination(isPresented: $coordinator.isNavigating) {
                    coordinator.destinationView
                }
        }
    }
    
    //    private func fetchOffers() {
    //        NetworkManager.shared.fetchOffers { result in
    //            switch result {
    //            case .success(let offersModel):
    //                self.offers = offersModel.offers
    //            case .failure(let error):
    //                print("Error fetching offers: \(error)")
    //            }
    //        }
    //    }
    
    private func getImageName(for id: Int) -> String {
        let imageNames = [
            1: "coupleAfrica",
            2: "coupleStudio",
            3: "lampabikt"
            
        ]
        
        return imageNames[id] ?? "dieAntwood"
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
                    .onChange(of: flightFrom) { oldValue, newValue in
                        let filtered = newValue.filter { $0.isCyrillic || $0.isWhitespace }
                        if filtered != newValue {
                            flightFrom = filtered
                        }
                    }
                    
                    Rectangle()
                        .fill(Color.gray)
                        .padding(.trailing)
                        .frame(height: 1)
                        .frame(width: 250)
                    
                    TextField("",
                              text: $flightTo,
                              prompt: Text("Куда - Турция")
                        .foregroundStyle(Color.aviaGrey6))
                    .onChange(of: flightTo) { oldValue, newValue in
                        let filtered = newValue.filter { $0.isCyrillic || $0.isWhitespace }
                        if filtered != newValue {
                            flightFrom = filtered
                        }
                    }
                }.bold()
                    .foregroundStyle(.white)
                    .onTapGesture {
                        coordinator.showSheet(with: SearchingView(coordinator: coordinator, flightFrom: $flightFrom, flightTo: $flightTo))
                    }
                    .sheet(isPresented: $coordinator.isSheetPresented) {
                        SearchingView(coordinator: coordinator, flightFrom: $flightFrom, flightTo: $flightTo)
                    }
            }.offset(x: 30)
            
        }.padding(15)
        
    }
    
    @ViewBuilder
    func scrollCardView(offer: Offer) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            let imageName = getImageName(for: offer.id)
            let formattedPrice = formatPrice(offer.price.value)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
                .cornerRadius(16)
            
            Text(offer.title)
                .font(.headline)
                .foregroundStyle(.white)
            Text(offer.town)
                .font(.subheadline)
                .foregroundStyle(.white)
            HStack {
                Image("planeMain")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(Color.aviaGrey7)
                Text("от \(formattedPrice) ₽")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
        }
    }
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

extension Character {
    var isCyrillic: Bool {
        guard let scalar = UnicodeScalar(String(self)) else { return false }
        let cyrillicCharacters = "А"..."я"
        return cyrillicCharacters.contains(String(scalar))
    }
}

#Preview {
    AviaView(coordinator: MainCoordinator())
}
