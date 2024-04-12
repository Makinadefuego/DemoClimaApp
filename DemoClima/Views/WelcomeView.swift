//
//  WelcomeView.swift
//  DemoClima
//
//  Created by Fernando Daniel Portilla Posadas on 11/04/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    
    
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Clima Actual").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("Esta aplicación usa tu ubicación actual para obtener el clima de tu área").padding()
                
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(20).symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
