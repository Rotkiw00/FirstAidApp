//
//  InfoPageContentView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 28/12/2021.
//

import SwiftUI

struct InfoPageContentView: View {
    
    struct EmergencyNumsLabel: ViewModifier{
        func body(content: Content) -> some View {
            content
                .font(.system(size: 25, weight: .heavy, design: .rounded))
                .frame(width: 350, alignment: .leading)
        }
    }
    
    let headerTitle = "Informacje"
    let gradient = LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView{
            ZStack {
                gradient
                    .opacity(0.25)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Aplikacja \"Pierwsza Pomoc Przedmedyczna\" została zrealizowana jako projekt przedmiotowy z Technologii Obliczeniowych w Aplikacjach Medycznych (TOwAM).\n\nPoniżej znajdują się pozostałe ważne numery alarmowe.\n")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.top)
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(.black)
                    Spacer()
                    Spacer()
                    ScrollView {
                        Group {
                            VStack {
                                Text("Pogotowie ratunkowe").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "999")}) {
                                    Text("999").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Straż pożarna").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "998")}) {
                                    Text("998").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Policja").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "997")}) {
                                    Text("997").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Numer ratunkowy nad wodą").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "601100100")}) {
                                    Text("601 100 100").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Numer ratunkowy w górach").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "601100300")}) {
                                    Text("601 100 300").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Pogotowie energetyczne").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "991")}) {
                                    Text("991").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Pogotowie gazowe").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "992")}) {
                                    Text("992").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Pogotowie ciepłownicze").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "993")}) {
                                    Text("993").bold()
                                }
                                Spacer()
                            }
                            VStack {
                                Text("Pogotowie kanalizacyjne").modifier(EmergencyNumsLabel())
                                Button(action: {callNumber(phoneNumber: "994")}) {
                                    Text("994").bold()
                                }
                                Spacer()
                            }
                        }
                    }
                    Text("Autor projektu: © Wiktor Kalaga")
                        .font(.system(size: 10))
                    Divider()
                }
                .navigationTitle(headerTitle)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    Image("redcross")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

struct InfoPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPageContentView()
    }
}

private func callNumber(phoneNumber:String) {
  if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}
