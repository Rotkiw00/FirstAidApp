//
//  BabyPageContentView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 26/11/2021.
//

import SwiftUI

struct BabyPageContentView: View {
    
    let protocolsHeadings: [String] = ["1️⃣ Sprawdź reakcję", "2️⃣ Noworodek reaguje", "3️⃣ Noworodek NIE reaguje", "4️⃣ NIE ODDYCHA", "5️⃣ REANIMACJA"]
    let protocolsDefinitions: [String] = ["Delikatnie potrząśnij niemowlakiem, sprawdź reakcję na bodźce, np.: łaskotanie stóp.", "Jeśli to bezpieczne i możliwe pozostaw niemowlę w takiej pozycji, w jakiej zastałeś. \n\nZweryfikuj stan dziecka - jeśli okaże się konieczne DZWOŃ PO POMOC! \nStale monitoruj stan niemowlaka.", "Zawołaj po POMOC. \n\nUdrożnij drogi oddechowe \n-Podłóż niemowlęciu coś pod plecki (na wysokości łopatek), tak aby główka opadła nieco do tzw \"pozycji neutralnej\" \n-Odchyl lekko główkę, połóż jedną dłoń na czolę a drugą unieś bródkę niemowlęcia. \n\nSprawdzaj oddech przez 10s. W przypadku jeśli: \n-Nie słyszysz wydychanego powietrza \n-Nie porusza się klatka piersiowa \n-Nie czujesz podmuchu wydychanego powietrza \n-Pojawiają się nieregularne oddechy \nNIE WACHAJ SIĘ I DZWOŃ PO POMOC. \nJeśli niemowlę tylko jest nieprzytomne, to postaraj się ułożyć je na boku i okryj, wezwij POMOC i ciągle obserwuj. \nNie panikuj!", "Dzwoń po pomoc! Wykonaj 5 oddechów ratowniczych. \n\nNabierz niewielką ilość powietrza do ust, obejmij swoimi ustami usta i nos niemowlęcia - wdmuchnij powoli powietrze aż do uniesienia klatki piersiowej. \n\nJeżeli stan się nie zmieni - RKO!", "Wyznacz punkt w dolnej części mostka niemowlęcia. Wykonaj 15 uciśnięć tego punktu dwoma palcami z cześtotliwością 100-120 uciśnięć/minutę. \n\nNastępnie wykonaj 2 wdmuchnięcia powietrza. \n\nPowtarzaj uciśnięcia i wdechy do przybycia pomocy medycznej. \n\nRKO można wykonywać również w sekwencji 30:2"]
    
    let headerTitleSubview = "Noworodek"
    @State private var checkReactionAlert = false
    @State private var reactAlert = false
    @State private var dontReactAlert = false
    @State private var dontBreatheAlert = false
    @State private var reanimationAlert = false
    
    // Style modifiers
    //1
    struct Shadow: ViewModifier {
            func body(content: Content) -> some View {
                content.shadow(color: Color.black, radius: 3, x: 2, y: 2)
            }
        }
    //2
    struct DeafultButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 320, height: 40)
                .modifier(Shadow())
                .font(Font.custom("Arial", size: 25))
                .padding(7)
                .background(Color.yellow)
                .cornerRadius(40)
                .foregroundColor(Color.white)
                .padding(3)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                .stroke(Color.yellow, lineWidth: 3))
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.yellow.opacity(0.40).ignoresSafeArea()
                VStack(spacing: -50) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 0)
                        .background(LinearGradient(colors: [.yellow.opacity(0.6), .purple.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Spacer()
                    VStack(spacing: 60) {
                        // 1
                        Button(action: {self.checkReactionAlert = true}) {
                            Text(protocolsHeadings[0]).modifier(DeafultButtonStyle())
                        }
                        .alert(isPresented: $checkReactionAlert, content: {
                            Alert(title: Text(protocolsDefinitions[0]), message: nil, dismissButton: .default(Text("Rozumiem")))
                        })
                        
                        // 2
                        Button(action: {self.reactAlert = true}) {
                            Text(protocolsHeadings[1]).modifier(DeafultButtonStyle())
                        }
                        .alert(isPresented: $reactAlert, content: {
                            Alert(title: Text(protocolsDefinitions[1]), message: nil, primaryButton: .default(Text("Dzwonię po pomoc!"), action: {callNumber(phoneNumber: "112")})
                                ,secondaryButton: .cancel(Text("Rozumiem")))
                        })
                        
                        // 3
                        Button(action: {self.dontReactAlert = true}) {
                            Text(protocolsHeadings[2]).modifier(DeafultButtonStyle())
                        }
                        .alert(isPresented: $dontReactAlert, content: {
                            Alert(title: Text(protocolsDefinitions[2]), message: nil, primaryButton: .default(Text("Dzwonię po pomoc!"), action: {callNumber(phoneNumber: "112")})
                                  ,secondaryButton: .cancel(Text("Rozumiem")))
                        })
                        
                        // 4
                        Button(action: {self.dontBreatheAlert = true}) {
                            Text(protocolsHeadings[3]).modifier(DeafultButtonStyle())
                        }
                        .alert(isPresented: $dontBreatheAlert, content: {
                            Alert(title: Text(protocolsDefinitions[3]), message: nil, primaryButton: .default(Text("Dzwonię po pomoc!"), action: {callNumber(phoneNumber: "112")})
                                  ,secondaryButton: .cancel(Text("Rozumiem")))
                        })
                        
                        // 5
                        Button(action: {self.reanimationAlert = true}) {
                            Text(protocolsHeadings[4]).modifier(DeafultButtonStyle())
                        }
                        .alert(isPresented: $reanimationAlert, content: {
                            Alert(title: Text(protocolsDefinitions[4]), message: nil, primaryButton: .default(Text("Dzwonię po pomoc!"), action: {callNumber(phoneNumber: "112")})
                                  ,secondaryButton: .cancel(Text("Rozumiem")))
                        })
                        
                    }
                    Spacer()
                }
                .navigationTitle(headerTitleSubview)
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup {
                    Image("redcross")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .position(x: 15, y: 66)
                }
            }
        }
    }
}

struct BabyPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        BabyPageContentView()
    }
}

// Useful functions
private func callNumber(phoneNumber:String) {
  if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}
