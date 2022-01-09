//
//  HospitalsPageContentView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 26/11/2021.
//

import SwiftUI
import MapKit

struct HospitalsPageContentView: View {
    
    let headerTitleSubview = "Szpitale"
    
    let hospitals = [
        Place(name: "Szpital Miejski \nw Sosnowcu", latitude: 50.27133077086624, longtitude: 19.13193271589553, phoneNum: "+48324130300"),
        Place(name: "Szpital Świętej Elżbiety \nw Katowicach", latitude: 50.25780807798805, longtitude: 19.033578536898425, phoneNum: "+48801502302"),
        Place(name: "Uniwersyteckie Centrum Kliniczne \nim. prof. K. Gibińskego ŚUM \nw Katowicach", latitude: 50.224080891845084, longtitude: 18.954485365937206, phoneNum: "+48327894000"),
        Place(name: "Szpital Miejski \nw Zabrzu", latitude: 50.326458995851226, longtitude: 18.827850964664066, phoneNum: "+48322776100"),
        Place(name: "Szpital Miejski \nw Rudzie Śląskiej", latitude: 50.31531383752942, longtitude: 18.88874810814391, phoneNum: "+48323440724"),
        Place(name: "Samodzielny Wojewodzki Szpital Chirurgi Urazowej \nim. J.Daaba", latitude: 50.37238825846608, longtitude: 18.944539377349184, phoneNum: "+48323934100"),
        Place(name: "Zagłębiowskie Centrum Onkologii", latitude: 50.320376660773576, longtitude: 19.176765103090148, phoneNum: "+48326212000"),
        Place(name: "Szpital Specjalistyczny \nw Zabrzu", latitude: 50.31399768316613, longtitude: 18.781441792589174, phoneNum: "+48323732300"),
        Place(name: "Szpital Powiatowy \nw Będzinie", latitude: 50.324932952034274, longtitude: 19.131750948772446, phoneNum: "+48322673011"),
        Place(name: "Szpital Wielospecjalistyczny \nw Gliwicach", latitude: 50.289100210943246, longtitude: 18.660707519559004, phoneNum: "+48322382091"),
        Place(name: "SPZOZ Szpital nr 2 \nim. dr Tadeusza Boczonia", latitude: 50.246984755051244, longtitude: 19.13306769127604, phoneNum: "+48723183348"),
        Place(name: "Szpital Murcki", latitude: 50.19905769814888, longtitude: 19.04182631219033, phoneNum: "+48322556162")
    ]
    
    // region: 50.291330, 18.919265
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.291330, longitude: 18.919265), span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: hospitals) { place in MapAnnotation(coordinate: place.coordinate) {
                    Button(action: {callNumber(phoneNumber: place.phoneNum)}) {
                        HospitalAnnotationView(title: place.name)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                
                VStack(spacing: -50) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 0)
                        .background(LinearGradient(colors: [.yellow.opacity(0.6), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Spacer()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(headerTitleSubview)
        }
    }
}

struct TestPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsPageContentView()
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
