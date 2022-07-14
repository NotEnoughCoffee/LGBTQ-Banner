//
//  NavigationBarView.swift
//  LGBTQ+ Banner
//
//  Created by Kevin Cooper on 7/11/22.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var selectedNavigationItem : String
    //@Binding var showingHome : Bool
    //@Binding var showingImage : Bool
    
    var body: some View {
        
        Rectangle()
            .ignoresSafeArea()
            .frame(width: .infinity, height: 20)
            .opacity(0.1)
            .overlay(
                VStack {
                    HStack (spacing: 100) {
                        Button(action: {
                            selectedNavigationItem = "home"
                            //showingHome = true
                            //showingImage = false
                        }) {
                            Image(systemName: "house")
                                .padding(.top, 40)
                                .foregroundColor(selectedNavigationItem == "home" ? .green : .blue)
                            
                        }
                        Button(action: {
                            selectedNavigationItem = "photo"
                            //showingImage = true
                            //showingHome = false
                        }) {
                            Image(systemName: "photo")
                                .padding(.top, 40)
                                .foregroundColor(selectedNavigationItem == "photo" ? .green : .blue)
                        }
                        Button(action: {
                            selectedNavigationItem = "moreInfo"
                        }) {
                            Image(systemName: "newspaper")
                                .padding(.top, 40)
                                .foregroundColor(selectedNavigationItem == "moreInfo" ? .green : .blue)
                        }
                        
                    }
                    Spacer()
                }
                
            )
    }
}

struct NavigationBarView_Previews: PreviewProvider {
        
    static var previews: some View {
        //NavigationBarView(selectedNavigationItem: .constant("photo"), showingHome: .constant(true), showingImage: .constant(false))
        NavigationBarView(selectedNavigationItem: .constant("photo"))
    }
}
