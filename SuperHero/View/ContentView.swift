//
//  ContentView.swift
//  SuperHero
//
//  Created by Asalah Sayed on 23/07/2023.
//

import SwiftUI

struct ContentView: View {
    var superheros: [Superhero] = superherosData
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(superheros){ item in
                    SuperheroView(superH: item)
                }
            }//: HStack
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
