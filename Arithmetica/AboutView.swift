//
//  AboutView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack{
                Text("Arithmetica")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("An arithmetic game + - × ÷")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Game Parameters: ")
                    .padding(.horizontal)
                Text("Lower Bound → Lowest possible integer value in a random equation.")
                    .foregroundColor(.green)
                    .padding(.horizontal)
                
                Text("Upper Bound → Highest possible integer value in a random equation.")
                    .foregroundColor(.green)
                    .padding(.horizontal)
                
                Text("Time in Seconds → Length of the game.")
                    .foregroundColor(.green)
                    .padding(.horizontal)
                
                Text("Operation → + - × ÷")
                    .foregroundColor(.green)
                    .padding(.horizontal)
                
                Text("Select your game parameters, then view your high scores or click Play!")
                    .padding(.horizontal)
                
                Text("Play! → Solve as many arithmetic problems as possible before the timer runs out! Answers are only accepted if they are correct. You cannot skip a question.")
                    .foregroundColor(.purple)
                    .padding(.horizontal)
                
                Text("High Score → View your high scores for the selected game parameters. The high score will be at the top of the list.")
                    .foregroundColor(.purple)
                    .padding(.horizontal)
            }
            .padding(.vertical)
            Text("Have Fun!!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
