//
//  ContentView.swift
//  DemoClima
//
//  Created by Fernando Daniel Portilla Posadas on 11/04/24.
//

import SwiftUI

struct ContentView: View {
    //Inicializando el LocationManager (state object es para que la vista pueda identificar cuando las variables marcadas como @Published son actualizadas)
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        
        VStack {
            if let location = locationManager.location {
                if let weather = weather{
                    WeatherView(weather: weather)
                }else{
                    LoadingView().task {
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        }catch{
                            print("Error al obtener el clima actual: \(error)" )
                        }
                    }
                }
            } else {
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.581, saturation: 0.674, brightness: 1.0)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
