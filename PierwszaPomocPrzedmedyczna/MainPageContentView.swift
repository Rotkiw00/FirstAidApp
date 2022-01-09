//
//  MainPageContentView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 26/11/2021.
//

import SwiftUI

struct MainPageContentView: View {
    
    @State private var babySwitch: Int? = 0
    @State private var childSwitch: Int? = 0
    @State private var isRapidHelpAlertVisible = false
    @State private var isCalledButtonVisible = false
    let headerTitle = "PIERWSZA POMOC PRZEDMEDYCZNA"

    // Style modifiers
    //1
    struct HeaderLabelStyle: ViewModifier {
            func body(content: Content) -> some View {
                content
                .font(Font.custom("Arial Rounded MT Bold", size: 20))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(Color(#colorLiteral(red: 1, green: 0.8196078538894653, blue: 0.3529411852359772, alpha: 1)))
                .modifier(Shadow())
            }
        }
    //2
    struct Shadow: ViewModifier {
            func body(content: Content) -> some View {
                content.shadow(color: Color.black, radius: 3, x: 2, y: 2)
            }
        }
    //3
    struct BigRapidHelpBttnStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
        }
    }
    //4
    struct DeafultButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 100, height: 20)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .padding(7)
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(Color.white)
                .padding(3)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                .stroke(Color.green, lineWidth: 3))
        }
    }
    
    //5
    struct EmergencyCallButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 200, height: 20)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .padding(7)
                .background(Color.red)
                .cornerRadius(40)
                .foregroundColor(Color.white)
                .padding(3)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                .stroke(Color.red, lineWidth: 3))
        }
    }
    
    /*Main Page View*/
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.opacity(0.40).ignoresSafeArea()
                VStack(spacing: -50) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(colors: [.green.opacity(0.6), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Spacer()
                    ZStack {
                        Circle()
                        .fill(Color(#colorLiteral(red: 1, green: 0.8196078538894653, blue: 0.3529411852359772, alpha: 1)))
                        
                        Circle().strokeBorder(Color.green, lineWidth: 3)
                        
                        Button(action: {self.isRapidHelpAlertVisible = true }) {
                            Text("Szybka pomoc !").modifier(BigRapidHelpBttnStyle())}
                        .actionSheet(isPresented: $isRapidHelpAlertVisible, content: {
                            ActionSheet(title: Text("Komu chcesz pomóc ?")
                                .bold(),
                                message: Text("Wybranie grupy docelowej przeniesie Cię do nowego widoku."),
                                buttons: [
                                        .cancel(Text("Zamknij")),
                                        .default(Text("Noworodek"),
                                                 action: {self.childSwitch = 1}),
                                        .default(Text("Dziecko"),
                                                 action: {self.babySwitch  = 1})
                                ]
                            )
                        })
                    }
                    .frame(width: 175, height: 175)
                    Spacer()
                    
                    NavigationLink(destination: BabyPageContentView(), tag: 1, selection: self.$childSwitch) {
                    }
                    Spacer()
                    NavigationLink(destination: ChildPageContentView(), tag: 1, selection: self.$babySwitch) {
                    }
                    
                    VStack(spacing: 50) {
                        HStack(spacing: 90) {
                            VStack {
                                Image("learn")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                NavigationLink(destination: LearnPageContentView()) {
                                    Text("Nauka").modifier(DeafultButtonStyle())
                                }
                            }
                            VStack {
                                Image("hospital")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                NavigationLink(destination: HospitalsPageContentView()) {
                                    Text("Szpitale").modifier(DeafultButtonStyle())
                                }
                            }
                        }
                        
                        VStack(spacing: 8){
                            Image("emergency")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Button(action: {self.isCalledButtonVisible = true}) {
                                Text("Wzywam pomoc!").modifier(EmergencyCallButtonStyle())
                            }
                            .alert(isPresented: $isCalledButtonVisible, content: {
                                Alert(title: Text("Czy na pewno chcesz zadzwonić po pomoc ?").bold(), message: nil, primaryButton: .default(Text("Dzwonię po pomoc!"), action: {
                                    callNumber(phoneNumber: "112")})
                                    ,secondaryButton: .cancel(Text("Jednak nie.")))})
                        }
                    }
                    Spacer()
                }
                .navigationTitle(headerTitle)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        NavigationLink(destination: InfoPageContentView()){
                            Image("redcross")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
        }
    }
}

struct MainPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageContentView()
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
