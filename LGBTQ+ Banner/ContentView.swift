//
//  ContentView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/11/22.
//

import SwiftUI

struct ContentView: View {
    //@State var showingHome : Bool = true
    //@State var showingImage : Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var selectedImage: UIImage?
    @State var isImagePickerDisplay = false
    @State var tabNavigationSelection : String = "moreInfo"
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .teal]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                // Home View
                if tabNavigationSelection == "home" {
                    HomeView(selectedNavigationItem:$tabNavigationSelection, selectedImage: $selectedImage)
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.3)))
                } else if tabNavigationSelection == "photo"{
                    ImageView(selectedNavigationItem: $tabNavigationSelection, sourceType: $sourceType, selectedImage: $selectedImage, isImagePickerDisplay: $isImagePickerDisplay)
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.3)))
                } else if tabNavigationSelection == "moreInfo" {
                    GeoTestView()
                    //OverlayView()
                }
                //showingHome ? HomeView() : ImageView()
                Spacer()
                //NavigationBarView(selectedNavigationItem: $tabNavigationSelection, showingHome: $showingHome, showingImage: $showingImage)
                NavigationBarView(selectedNavigationItem: $tabNavigationSelection)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
