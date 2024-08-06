//
//  MainContactsListView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.08.2024.
//

import SwiftUI

struct MainContactsListView: View {
    
    let dataSource = [
    Contact(firstName: "Nikolas", middleName: "Sidorkin", mobileOperator: "Beeline", avatar: "avatarContactFirst"),
    Contact(firstName: "Ivan", middleName: "Smit", mobileOperator: "MTS Russia", avatar: "avatarContactFirst"),
    Contact(firstName: "Jon", middleName: "Salogub", mobileOperator: "TELE 2", avatar: "avatarContactFirst"),
    Contact(firstName: "Magomed", middleName: "Jonson", mobileOperator: "Beeline", avatar: "avatarContactFirst"),
    Contact(firstName: "Toni", middleName: "Perecatipole", mobileOperator: "YOTA Rossia", avatar: "avatarContactFirst")
    ]
    
    var body: some View {
        ScrollView {
            ForEach(dataSource) { dataSource in
                VStack(alignment: .leading) {
                    MainContactView(title: dataSource.fullName, subTitle: dataSource.mobileOperator, imageName: dataSource.avatar).frame(width: 260, height: 60)
                }
            }
        }.applyBackground()
    }
}

#Preview {
    MainContactsListView()
}
