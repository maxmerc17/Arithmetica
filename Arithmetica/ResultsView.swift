//
//  ResultsView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct ResultsView: View {
    
    @Binding var game : Game
    
    @Environment(\.dismiss) private var dismiss
    
    func onClick() {
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
                
                Button(action: onClick ) {
                    Text("Okay").padding().background(.white).foregroundColor(.black)
                }.cornerRadius(45)
            }.padding()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(game: .constant(Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)))
    }
}
