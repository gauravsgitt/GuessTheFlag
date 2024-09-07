//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gaurav Bisht on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showWrongAnswerAlert = false
    @State private var selectedFlagIndex: Int?
    @State private var showWinAlert = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [Gradient.Stop(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                   Gradient.Stop(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                                  ],
                           center: .top,
                           startRadius: 300,
                           endRadius: 500)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            if number == correctAnswer {
                                score += 1
                                countries.shuffle()
                                correctAnswer = Int.random(in: 0...2)
                            } else {
                                selectedFlagIndex = number
                                showWrongAnswerAlert = true
                            }
                        } label: {
                            FlagImage(flagName: countries[number])
                        }
                    }
                }
                .padding(.bottom, 30)
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
                
                Spacer()
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .alert("Wrong!", isPresented: $showWrongAnswerAlert) {
            Button("Close", role: .cancel) { }
        } message: {
            Text(String("You have selected the flag of \(countries[selectedFlagIndex ?? 0])"))
        }
        .alert("", isPresented: $showWinAlert) {
            Button("Restart") {
                score = 0
            }
        } message: {
            Text("You won! Please restart the game.")
        }
        .onChange(of: score) { oldValue, newValue in
            showWinAlert = newValue == 8
        }
    }
}

#Preview {
    ContentView()
}
