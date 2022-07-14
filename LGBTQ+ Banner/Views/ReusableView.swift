//
//  ReusableView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/11/22.
//

import SwiftUI

struct ReusableView: View {
    var body: some View {
        VStack {
            HomeTitle(title: "Title!", subTitle: "SubTitle!")
        }
        
    }
}


struct HomeTitle: View {
    var title : String
    var subTitle : String
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.white)
        Text(subTitle)
            .font(.subheadline)
            .foregroundColor(Color(hue: 1.0, saturation: 0.061, brightness: 0.839))
    }
}

struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ReusableView()
        }
    }
}
