//
//  MainCoordinator.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.5.24..
//

import SwiftUI

class MainCoordinator: ObservableObject {
    
    @Published var selectedTab: Tab = .avia
    @Published var isSheetPresented: Bool = false
    @Published var isNavigating: Bool = false
    @Published var sheetContent: AnyView?
    @Published var destinationView: AnyView?
    @Published var isDatePickerPresented = false
    @Published var selectedDate: Date = Date()
    @Published var isReturnDatePickerPresented = false
    @Published var selectedReturnDate: Date? = nil
    
    //MARK: Tab Navigation
    enum Tab: String {
        case avia = "Авиабилеты"
        case hotels = "Отели"
        case shortly = "Короче"
        case cruises = "Круизы"
        case subscriptions = "Подписки"
        case profile = "Профиль"
    }
    
    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
    
    //MARK: Sheet Navigation
    func showSheet<Content: View>(with view: Content) {
        sheetContent = AnyView(view)
        isSheetPresented = true
    }
    
    func hideSheet() {
        isSheetPresented = false
        sheetContent = nil
    }
    
    //MARK: Push Navigation
    func push<Content: View>(_ view: Content) {
        destinationView = AnyView(view)
        isNavigating = true
    }
    
    func hideSheetAndPush<Content: View>(_ view: Content) {
        withAnimation {
            self.isSheetPresented = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.destinationView = AnyView(view)
            self.isNavigating = true
        }
    }
    
    func pop() {
        isNavigating = false
        destinationView = nil
    }
    
    //MARK: Validation of the filled TextField
    
    func validateFieldsAndNavigate(flightFrom: String, flightTo: String, content: AnyView) {
        if !flightFrom.isEmpty && !flightTo.isEmpty {
            hideSheetAndPush(content)
        } else {
            print("Заполните оба поля")
        }
    }
    
    //MARK: Showing Calendar Pickdate Sheet
    
    func showDatePicker(selectedDate: Binding<Date>) {
        self.selectedDate = selectedDate.wrappedValue
        isDatePickerPresented = true
    }
    
    func showReturnDatePicker(selectedDate: Binding<Date?>) {
        self.selectedReturnDate = selectedDate.wrappedValue
        isReturnDatePickerPresented = true
    }
}
