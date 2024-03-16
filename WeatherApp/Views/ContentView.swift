//
//  ContentView.swift
//  WeatherApp
//
//  Created by Siddharth Pillai on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather{
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task{
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude   )
                            }catch{
                                print("Error getting weather:\(error)")
                            }
                        }
                }
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.673, saturation: 0.842, brightness: 0.512))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
