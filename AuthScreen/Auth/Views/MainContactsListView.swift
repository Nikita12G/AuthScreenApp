//
//  MainContactsListView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 06.08.2024.
//

import SwiftUI

struct MainContactsListView: View {
    
    let dataSource = [
        Contact(avatar: "avatarContactFirst", firstName: "Nikolas", middleName: "Sidorkin", jobTitle: "Старший маркетолог, market guru", mobileOperator: "Beeline", allSailsValue: 200, sailValue: 130, gradeValue: 4.7),
        Contact(avatar: "avatarContactFirst", firstName: "Ivan", middleName: "Smit", jobTitle: "Маркетолог, market guru", mobileOperator: "MTS Russia", allSailsValue: 200, sailValue: 150, gradeValue: 4.7),
        Contact(avatar: "avatarContactFirst", firstName: "Jon", middleName: "Salogub", jobTitle: "Маркетолог, market guru", mobileOperator: "TELE 2", allSailsValue: 200, sailValue: 30, gradeValue: 4.1),
        Contact(avatar: "avatarContactFirst", firstName: "Magomed", middleName: "Jonson", jobTitle: "Маркетолог, market guru", mobileOperator: "Beeline", allSailsValue: 200, sailValue: 133, gradeValue: 4.3),
        Contact(avatar: "avatarContactFirst", firstName: "Toni", middleName: "Perecatipole", jobTitle: "Маркетолог, market guru", mobileOperator: "YOTA Rossia", allSailsValue: 200, sailValue: 190, gradeValue: 4.9)
    ]
    
    private let isDetailList: Bool
    
    init(isDetailList: Bool) {
        self.isDetailList = isDetailList
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(isDetailList ? Constants.marketingManagersTitle : Constants.contactsTitle)
                    .font(Fonts.montserrat(ofSize: isDetailList ? 18 : 16))
                    .foregroundStyle(Colors.White)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 4, trailing: 20))
            }
            ForEach(dataSource) { dataSource in
                VStack(alignment: .leading) {
                    if isDetailList {
                        MainContactDetailView(
                            title: dataSource.fullName,
                            jobTitle: dataSource.jobTitle,
                            imageName: dataSource.avatar,
                            sailsValueStr: dataSource.sailsProgressStr,
                            gradeValue: dataSource.gradeValue,
                            sailsProgressPercent: dataSource.sailsProgresProcent,
                            sailsValue: dataSource.sailsProgres)
                        .frame(width: 456, height: 112)
                        .padding(12)
                    } else {
                        MainContactView(title: dataSource.fullName, subTitle: dataSource.mobileOperator, imageName: dataSource.avatar).frame(width: 260, height: 60)
                    }
                }
            }
        }.background(isDetailList ? AuthGradientView() : nil)
            .cornerRadius(28)
    }
}

#Preview {
    MainContentView()
}
