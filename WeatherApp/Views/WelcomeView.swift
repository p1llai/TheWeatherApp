//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Siddharth Pillai on 3/17/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to The Weather App")
                    .bold().font(.title)
                
                Text("Please share your location to get the Weather")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(25)
            .foregroundColor(.white)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
