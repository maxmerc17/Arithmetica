//
//  HighScoreView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-09.
//

import SwiftUI

struct HighScoreView: View {
    @Binding var games : [Game]
    @Binding var game : Game
    
    var Score : Int {
        games = games.sorted(by: { $0.score > $1.score })
        for pastGame in games{
            if  (game.lower_bound == pastGame.lower_bound) && (game.upper_bound == pastGame.upper_bound) && (game.time_limit == pastGame.time_limit) && (game.operation == pastGame.operation){
                return pastGame.score
            }
        }
        return 0
    }
    
    var body: some View {
        VStack{
            Text("\(Score)")
        }
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        HighScoreView(games: .constant([game]), game: .constant(game))
    }
}
