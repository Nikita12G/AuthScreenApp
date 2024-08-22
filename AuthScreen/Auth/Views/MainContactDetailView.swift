//
//  MainContactDetailView.swift
//  AuthScreen
//
//  Created by Никита Гуляев on 20.08.2024.
//

import Foundation

import SwiftUI

struct MainContactDetailView: View {
    private var title: String
    private var jobTitle: String
    private var imageName: String
    private var sailsValue: Double
    private var sailsValueStr: String
    private var gradeValue: Double
    private var sailsProgressPercent: String
    
    init(title: String, jobTitle: String, imageName: String, sailsValueStr: String, gradeValue: Double, sailsProgressPercent: String, sailsValue: Double) {
        self.title = title
        self.imageName = imageName
        self.jobTitle = jobTitle
        self.sailsValueStr = sailsValueStr
        self.gradeValue = gradeValue
        self.sailsProgressPercent = sailsProgressPercent
        self.sailsValue = sailsValue
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(imageName)
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                            .font(Fonts.montserrat(ofSize: 14))
                            .foregroundStyle(Colors.White)
                        Spacer()
                        Image("starIcon")
                        Text(gradeValue.description)
                            .font(Fonts.montserrat(ofSize: 14))
                            .foregroundStyle(Colors.White)
                    }
                    Text(jobTitle)
                        .font(Fonts.montserrat(ofSize: 14))
                        .foregroundStyle(Colors.Grey)
                }
            }.padding(12)
            VStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Colors.White.opacity(0.08))
                        .frame(width: 432, height: 6)
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Colors.Blue)
                        .frame(width: 432 * CGFloat(sailsValue), height: 6)
                        .cornerRadius(12)
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 10, trailing: 0))
                HStack {
                    Text("\(Constants.contactListSailsProgress)\(sailsValueStr)")
                        .font(Fonts.montserrat(ofSize: 12))
                        .foregroundStyle(Colors.White)
                    Spacer()
                    Text("\(Constants.contactListSailsComplete) \(sailsProgressPercent)")
                        .font(Fonts.montserrat(ofSize: 12))
                        .foregroundStyle(Colors.White)
                }
            }.padding(EdgeInsets(top: 0, leading: 12, bottom: 16, trailing: 12))
        }.background(Colors.White.opacity(0.04))
            .cornerRadius(16)
    }
}

#Preview {
    MainContentView()
}
