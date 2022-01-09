//
//  ListCell.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 27/11/2021.
//

import SwiftUI

struct ListCell: View {
    var protocolTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                HStack {
                    Text(protocolTitle)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding(.leading, 10)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(protocolTitle: "Protocol")
    }
}
