//
//  HospitalAnnotationView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 05/12/2021.
//

import SwiftUI

struct HospitalAnnotationView: View {
    
    let title: String
    @State private var showHospitalName = true
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.callout)
                .padding(5)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(Color.black)
                .opacity(showHospitalName ? 0 : 1)
                
            Image(systemName: "h.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showHospitalName.toggle()
            }
        }
    }
}

struct HospitalAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalAnnotationView(title: "My hospital View")
            .background(Color.gray)
    }
}
