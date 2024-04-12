//
//  WeatherView.swift
//  DemoClima
//
//  Created by Fernando Daniel Portilla Posadas on 11/04/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(weather.name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Hoy, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack(spacing : 20){
                            Text("El clima es:")
                            HStack{
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@4x.png")) {image in image.resizable().aspectRatio(contentMode: .fit).frame(width: 80)
                                }   placeholder: {
                                    ProgressView()
                                }
                                Text(weather.weather[0].description.uppercased()).fontWeight(.light)
                            }
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Text(weather.main.feelsLike.roundDouble() + "°").font(.system(size: 100)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://humanandmachine.co/assets/images/building-1-1.png")) {image in image.resizable().aspectRatio(contentMode: .fit).frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Clima actual").bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Temperatura min.", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Temperatura máx.", value: (weather.main.temp.roundDouble() + "°"))
                        
                        
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Vel. del viento", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humedad", value: (weather.main.humidity.roundDouble() + "%"))
                        Spacer()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.581, saturation: 0.674, brightness: 1.0)).background(.white).cornerRadius(20, corners: [.topLeft, .topRight])
            }

        }
        .edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.581, saturation: 0.674, brightness: 1.0)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
