//
//  ContentView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

struct GameView: View {
    @Binding var game : Game
    @Binding var isPresentingGame : Bool
    var body: some View {
        VStack {
            
            TimerView(game: $game, isPresentingGame: $isPresentingGame)
            EquationView(game: $game)
            
            Spacer()
            ZStack {
                Label("Score: \(game.score)", systemImage: "minus.forwardslash.plus")
            }.padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(data: Game.Data())
        GameView(game: .constant(game), isPresentingGame: .constant(true))
    }
}
