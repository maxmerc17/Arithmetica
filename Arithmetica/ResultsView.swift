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
    
    /*@State private var navigate : Bool = false*/
    
    /*func update() {
        games.append(game)
        navigate = true
    }*/
    
    var body: some View {
        VStack{
            Text("Well Done, you scored ") + Text("\(game.score)").foregroundColor(.red) + Text("!")
            
            /*Button(action: update){
                Text("Save and Return to Main Menu")
            }.padding()*/
            
            /*NavigationLink(destination: WelcomeView(games: <#T##Binding<[Game]>#>, saveAction: <#T##() -> Void#>), isActive: $navigate) { EmptyView() }*/
        }.onAppear(){
            //games.append(game)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(games: .constant([Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)]), game : .constant(Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)))
    }
}
