//
//  ImageView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/11/22.
//

import SwiftUI

struct ImageView: View {
    @Binding var selectedNavigationItem : String
    @Binding var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    @Binding var isImagePickerDisplay : Bool
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        VStack {
            HomeTitle(title: "Upload your Image", subTitle: "Take or Upload an Image")
            Spacer()
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: deviceWidth - 100)
                OverlayView()
            } else {
                EmptyView()
            }
            Spacer()
            if self.sourceType == .camera {
                ImageUploadView(sourceType: $sourceType, selectedImage: $selectedImage, isImagePickerDisplay: $isImagePickerDisplay)
            }
            
            HStack (spacing: 30){
                Button() {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
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
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
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
            Spacer()
            Spacer()
//            HStack (spacing: 20 ){
//                Button("Camera") {
//                    self.sourceType = .camera
//                    self.isImagePickerDisplay.toggle()
//                }
//                .padding()
//                Button("Photo") {
//                    self.sourceType = .photoLibrary
//                    self.isImagePickerDisplay.toggle()
//                }
//                .padding()
//            }
            
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
//        VStack {
//            HomeTitle(title: "Upload your Image", subTitle: "Take or Upload an Image")
//            Spacer()
//            //ImageUploadView(customImageIsSelected: $customImageIsSelected, customImage: $customImage)
//                Button("Camera") {
//                    self.sourceType = .camera
//                    self.isImagePickerDisplay.toggle()
//                }.padding()
//
//                Button("photo") {
//                    self.sourceType = .photoLibrary
//                    self.isImagePickerDisplay.toggle()
//                }.padding()
//            Spacer()
//        }
    }
}


//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            // Background
//            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//            ImageView(selectedNavigationItem: .constant("photo"), customImageIsSelected: .constant(false), customImage: .constant(Image(systemName: "tray.and.arrow.up.fill")))
//        }
//    }
//}
