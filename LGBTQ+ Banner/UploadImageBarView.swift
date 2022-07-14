//
//  UploadImageBarView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/12/22.
//

import SwiftUI

struct UploadImageBarView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            HStack (spacing: 30){
                Button() {
                    print("Clicked!")
                } label : {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                            .foregroundStyle(.white, .teal)
                            //.font(.title)
                            .font(.system(size: 60))
                            .padding(.bottom, 1)
                        Text("Take Photo")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
                Button() {
                    print("Clicked!")
                } label : {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .foregroundStyle(.white, .teal)
                            .font(.system(size: 60))
                            .padding(.bottom, 1)
                        Text("Select Photo")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        
      
    }
}

struct UploadImageBarView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageBarView()
    }
}
