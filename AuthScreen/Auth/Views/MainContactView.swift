//
//  MainContactView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.08.2024.
//

import SwiftUI

struct MainContactView: View {
    private var title: String
    private var subTitle: String
    private var imageName: String
    
    init(title: String, subTitle: String, imageName: String) {
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
    }
    
    var body: some View {
        HStack {
            Image(imageName)
                .padding(EdgeInsets(top: 14, leading: 12, bottom: 14, trailing: 8))
            VStack(alignment: .leading) {
                Text(title)
                    .font(Fonts.montserrat(ofSize: 14))
                    .foregroundStyle(Colors.White)
                Text(subTitle)
                    .font(Fonts.montserrat(ofSize: 12))
                    .foregroundStyle(Colors.Grey)
            }.padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
            Spacer()
            Image("rightArrow")
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 12))
        }.background(Colors.White.opacity(0.04))
            .cornerRadius(16)
    }
}

#Preview {
    MainContactsListView(isDetailList: true)
}
