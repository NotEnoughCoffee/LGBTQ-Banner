//
//  OverlayTestView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/13/22.
//

import SwiftUI
private var profileImage = "profileImage"

struct TestView: View {
    var body: some View {
        VStack {
            Image("profileImage")
                .resizable()
                .clipShape(Circle())
                .padding()
                .overlay(prideFlagOverlay())
                .overlay(
                    TextDisplay(text: "LGBTQ+")
                        .padding(.top, 260)
                        //.padding(.top, 2000)
                )
                .mask(
                    Circle()
                        .padding()
                )
                .aspectRatio(contentMode: .fit)
                .shadow(color: .black, radius: 10, x: 1.0, y: 1.0)
        }
    }
}
struct OverlayTestView: View {
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            TabView {
                VStack {
                    //TestView()
                    Image(uiImage: render())
                    Button("Save to image") {
                        //let image = uiImage.snapshot()
                        let testImage = Image(uiImage: render())
                        UIImageWriteToSavedPhotosAlbum(testImage.snapshot(), nil, nil, nil)
                    }
                }
            }
            VStack {
                //TestView()
                
                
            }
        }
    }
    private func render() -> UIImage {
        TestView().asImage()
    }
    
}
struct prideFlagOverlay: View {
    var body: some View {
        HStack (spacing: 0){
            ForEach(Constants.prideColors, id : \.self) { namedColor in
                Rectangle()
                    .fill(namedColor)
                    .padding(.top, 270)
                    .frame(width: .infinity, height: 360, alignment: .bottom)
            }
        }
    }
}
struct ImageOverlay2: View {
    var body: some View {
        ZStack {
            Text("Hello")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
            .opacity(0.8)
            .cornerRadius(10.0)
            .padding(.top, 60)
    }
}
struct ImageOverlay3: View {
    var body: some View {
        ZStack {
            Text("KEvin")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
            .opacity(0.8)
            .cornerRadius(10.0)
            .padding(6)
    }
}
struct OverlayTestView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayTestView()
    }
}
