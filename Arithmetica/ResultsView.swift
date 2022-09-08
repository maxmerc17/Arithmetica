//
//  ResultsView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct ResultsView: View {
    @Binding var games : [Game]
    @Binding var game : Game
    @Binding var isPresentingResults : Bool
    let saveAction : () -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    func onOkay() {
        games.append(game)
        game = Game(lower_bound: game.lower_bound, upper_bound: game.upper_bound, time_limit: game.time_limit, operation: game.operation, score: 0)
        saveAction()
        dismiss()
    }
    
    func onDiscard(){
        game.score = 0
        dismiss()
    }
    
    var body: some View {
        ZStack {
            Color.blue.frame(width: 300, height: 315).cornerRadius(45) //UIScreen.main.bounds.size.height*0.90
            VStack{
                Group{
                    VStack{
                        Text("Well Done! You scored: ").foregroundColor(.white).padding()
                        
                        Text("\(game.score)").font(.largeTitle).bold().foregroundColor(.red) //Text("!").foregroundColor(.white)
                    }
                    
                }.padding()
                
                HStack{
                    Button(action: onOkay ) {
                        Text("Okay").padding().background(.white).foregroundColor(.black)
                    }.cornerRadius(45)
                    Button(action: onDiscard ) {
                        Text("Discard").padding().background(.white).foregroundColor(.black)
                    }.cornerRadius(45)
                }
                
            }.padding()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        ResultsView(games: .constant([game]), game: .constant(game), isPresentingResults: .constant(true), saveAction: {})
    }
}
