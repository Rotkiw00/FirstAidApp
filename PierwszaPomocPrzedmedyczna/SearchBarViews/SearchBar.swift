//
//  SearchBar.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 21/11/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var searchInput: String = ""
    @Binding var searching: Bool
    @Binding var mainList: [Int: String]
    @Binding var searchedList: [Int: String]

    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow.opacity(0.6), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
            HStack {
                // Search Bar
                HStack {
                    // Magnifying Glass Icon
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                    // Search Area TextField
                    TextField("Szukaj", text: $searchInput)
                        .onChange(of: searchInput, perform: { searchText in
                            searching = true
                            searchedList = mainList.filter { $0.value.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.value.contains(searchText) }
                        })
                        .accentColor(Color(red: 29.0 / 255.0, green: 204.0 / 255.0, blue: 108.0 / 255.0).opacity(0.7))
                        .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .background(LinearGradient(colors: [.yellow.opacity(1), .blue.opacity(1)], startPoint: .topLeading, endPoint: .bottomTrailing)).cornerRadius(8)

                Button(action: {
                    searching = false
                    searchInput = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Anuluj")})
                    .accentColor(Color.white)
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 8))
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .frame(height: 50)
    }
}
