//
//  ContentView.swift
//  NuevoView
//
//  Created by Kaleb on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack
        {
            Color.red.ignoresSafeArea()
            
            PruebaView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged
                    { value in
                        withAnimation(.spring())
                        {
                            currentDragOffsetY = value.translation.height
                        }
                    }
                        .onEnded
                    { value in
                        withAnimation(.spring())
                        {
                            if currentDragOffsetY < -150
                            {
                                endingOffsetY = -startingOffsetY
                            }
                            else if endingOffsetY != 0 && currentDragOffsetY > 150
                            {
                                endingOffsetY = 0
                            }
                            currentDragOffsetY = 0
                        }
                    }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PruebaView: View {
    var body: some View {
        VStack(spacing: 20)
        {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Aquí iría toda la información sobre los edificios del mapatlan mas el carrusel y todo lo demás")
                .multilineTextAlignment(.center)
            
            Text("Botón de Prueba")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(15))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
