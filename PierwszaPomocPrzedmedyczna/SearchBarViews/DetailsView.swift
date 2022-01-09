//
//  DetailsView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 27/11/2021.
//

import SwiftUI

struct DetailsView: View {
    
    var selectedProtocol: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    var headerBackTitleToSubview: String = "Wróć do protokołu"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.opacity(0.40).ignoresSafeArea()
                VStack {
                    ScrollView {
                    Text(selectedProtocol)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding()
                        .foregroundColor(.black)
                    }
                    .padding(.top)
                    
                    Spacer()
                    Spacer()
                    HStack {
                        Button(action: {callNumber(phoneNumber: "112")}) {
                            Image("emergency")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        Button(action: {}) {
                            NavigationLink(destination: InfoPageContentView()){
                                Image("info")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationTitle(headerBackTitleToSubview)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
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
