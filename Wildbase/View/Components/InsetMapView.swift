//
//  InsetMapView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    ))
    
    var body: some View {
        Map(position: $cameraPosition)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accent)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(
                        Color.black
                            .opacity(0.2)
                    )
                    .cornerRadius(10)
                }.padding()
                , alignment: .topTrailing
            )
            .frame(height: 250)
            .cornerRadius(10)
    }
}

#Preview {
    InsetMapView()
}
