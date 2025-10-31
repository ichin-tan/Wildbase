//
//  MapView.swift
//  Wildbase
//
//  Created by CP on 30/10/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var locations: [NationalParkLocation] = Bundle.main.decode("locations.json") ?? []
    
    @State private var cameraPosition = {
        var center = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var span = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
        var region = MKCoordinateRegion(center: center, span: span)
        return MapCameraPosition.region(region)
    }()
    
    @State private var mapCenter: CLLocationCoordinate2D = .init(latitude: 6.600286, longitude: 16.4377599)
    
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    CustomAnnotationView(location: location)
                }
                .annotationTitles(.hidden)
            }
        }
        .onMapCameraChange { context in
            mapCenter = context.region.center
        }
        .overlay(
            HStack(alignment: .center, spacing: 0) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        
                        Spacer()
                        Text("\(mapCenter.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        Spacer()
                        Text("\(mapCenter.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                }
                .padding(.trailing, 20)
            }
                .background(.black.opacity(0.8))
            .cornerRadius(10)
            .padding()
            , alignment: .top
        )
    }
}

#Preview {
    MapView()
}
