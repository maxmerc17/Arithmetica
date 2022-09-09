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
        ScrollView{
            Group{
                Text("These are the high scores for:").font(.headline) +  Text("\n\(game.operation.rawValue), values between \(game.lower_bound) and \(game.upper_bound), \(game.time_limit) second games").font(.caption)
            }.padding()
            
            ForEach($games) {
                $pastGame in
                if  (game.lower_bound == pastGame.lower_bound) && (game.upper_bound == pastGame.upper_bound) && (game.time_limit == pastGame.time_limit) && (game.operation == pastGame.operation){
                    Text("Score: ") + Text("\(pastGame.score)").foregroundColor(.red) + Text(", Date: \(pastGame.date.formatted())")
                }
                    
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
