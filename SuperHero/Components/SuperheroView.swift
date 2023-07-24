//
//  SuperheroView.swift
//  SuperHero
//
//  Created by Asalah Sayed on 25/07/2023.
//

import SwiftUI

struct SuperheroView: View {
    var superH: Superhero
    @State var isScaling: Bool = false
    @State var isSliding: Bool = false
    @State var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State var isAlertPresented : Bool = false
    var body: some View {
        ZStack{
            Image("\(superH.image)")
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScaling)
            VStack{
                Text("\(superH.title)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Button {
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack{
                        Text("About")
                        Image(systemName: "arrow.right.circle")
                    }
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAlertPresented){
                        Alert(title: Text("More About \(superH.title)"), message: Text("\(superH.message)"), dismissButton: .default(Text("Ok")))
                    }
                }
            }//: VStack
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 0.8), value: isSliding)
        }//: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: Color.black, radius: 2, x: 2, y: 2)
        .onAppear{
            isScaling = true
            isSliding = true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[3])
    }
}
