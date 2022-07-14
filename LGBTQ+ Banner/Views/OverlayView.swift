//
//  OverlayView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/13/22.
//

import SwiftUI
private var profileImage = "profileImage"


struct OverlayView: View {
    
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            TabView {
                VStack {
                    ZStack {
                        
                        ProfileImageView()
                        MyShape()
                    }
                    
                    SaveButtonView()
                }
                VStack {
                    ProfileImageView()
                    SaveButtonView()
                }
            }.tabViewStyle(.page)
        }
    }
    
}

struct MyShape : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: 200, y:400), radius: 200, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)

        return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
    }
}

struct SaveButtonView: View {
    var body: some View {
        Button("Save to image") {
            //let image = uiImage.snapshot()
            let pImage = Image(uiImage: render())
            UIImageWriteToSavedPhotosAlbum(pImage.snapshot(), nil, nil, nil)
        }
    }
    private func render() -> UIImage {
        ProfileImageView().asImage()
    }
}

struct ProfileImageView: View {
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
            GeometryReader { geometry -> Text in
                        let frame = geometry.frame(in: CoordinateSpace.local)
                        return Text("\(frame.origin.x), \(frame.origin.y), \(frame.size.width), \(frame.size.height)")
                    }
        }
    }
}

//struct ProfileImageView2: View {
//    var pImage = UIImage(named: profileImage)
//    var text : String
//    var body: some View {
//        ZStack {
//            Image(profileImage)
//                .resizable()
//                .clipShape(Circle())
//                .scaledToFit()
//                .padding()
//                .overlay(
//                    HStack (spacing: 0){
//                        ForEach(Constants.prideColors, id : \.self) { namedColor in
//                            Rectangle()
//                                .fill(namedColor)
//                                .padding(.top, 270)
//                                .frame(width: .infinity, height: 360, alignment: .center)
//                        }
//                    }
//                )
//                .overlay(
//                    TextDisplay(text: text)
//                        .padding(.top, 246)
//                )
//                .mask(
//                    Circle()
//                        .padding()
//                )
//                .shadow(color: .black, radius: 10, x: 1.0, y: 1.0)
//
//        }.padding()
//
//    }
//}

// MARK: - Displays Text over an Image
struct TextDisplay: View {
    var text : String
    var body: some View {
            ZStack {
                Text(text)
                    .padding(6)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }.background(Color.gray)
            .opacity(0.8)
            .cornerRadius(10.0)
            .padding(6)
        }
}

// MARK: - Overlays the Pride Flag Horizontally
struct PrideFlagView : View {

    var body : some View {
        HStack (spacing: 0){
            ForEach(Constants.prideColors, id : \.self) { namedColor in
                Rectangle()
                    .fill(namedColor)
                    .padding(.top, 270)
                    .frame(width: .infinity, height: 360, alignment: .center)
            }
        }
        
    }
}

struct PrideFlagViewGradient : View {

    var body : some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: Constants.prideColors), startPoint: .leading, endPoint: .trailing
                ))
                .frame(width: .infinity, height: 200, alignment: .center)
                .padding(.top, 380)
        }
        
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
