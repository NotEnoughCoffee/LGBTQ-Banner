//
//  HomeView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/11/22.
//

import SwiftUI

struct HomeView: View {
    let fade =  Gradient(colors: [Color.blue, Color.teal])
    @Binding var selectedNavigationItem : String
    @Binding var selectedImage: UIImage?
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var body: some View {
        VStack {
            HomeTitle(title: "Show Your LGBTQ+ Support", subTitle: "Upload your photo to get started")
            Spacer()
            VStack {
                Button(action: {
                          print("Pressed Upload Button")
                    selectedNavigationItem = "photo"
                        }) {
                            if selectedImage != nil {
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: deviceWidth - 100)
                            } else {
                            Image(systemName: "tray.and.arrow.up.fill")
                                .foregroundStyle(.teal, .white)
                                .font(.system(size: 60))
                            }
                        }
            }
            Text(selectedImage == nil ? "Upload your photo" : "")
                .foregroundColor(.white)
                .padding(.top, 10)
            Spacer()
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Background
//        ZStack {
//            // Background
//            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//            HomeView(selectedNavigationItem: .constant("home"))
//        }
//    }
//}
