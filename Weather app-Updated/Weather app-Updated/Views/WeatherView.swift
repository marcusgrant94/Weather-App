//
//  WeatherView.swift
//  Weather app-Updated
//
//  Created by Marcus Grant on 3/16/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight((.bold))
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://media.istockphoto.com/photos/haedong-yonggungsa-temple-and-haeundae-sea-in-busan-south-korea-picture-id483799458?k=20&m=483799458&s=612x612&w=0&h=j_KGUUAgzM7RuJVMXooiXG1mcAwH3y98yg6YgFDsDKc=")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.pressure.roundDouble() + "%"))
                }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.685, saturation: 0.988, brightness: 0.377))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.685, saturation: 0.988, brightness: 0.377))
        .preferredColorScheme(.dark)
    }
}
            


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
