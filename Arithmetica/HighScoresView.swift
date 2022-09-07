//
//  HighScoresView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-07.
//

import SwiftUI

struct HighScoresView: View {
    @Binding var games : [Game]
    @Binding var game : Game
    
    var body: some View {
        VStack{
            Text("THIS IS the high scores view")
                .padding()
            
            ForEach($games) {
                $game in Text("\(game.score)")
            }
        }.onAppear(){
            games = games.sorted(by: { $0.score > $1.score })
        }
        
    }
}

struct HighScoresView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        HighScoresView(games: .constant([game]), game: .constant(game))
    }
}
