//
//  TimerView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct TimerView: View {
    @Binding var games : [Game]
    @Binding var game : Game
    
    
    // to be passed to results view
    //@State private var game : Game = Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)
    
    @State var timeRemaining : Int = 20
    @State var textColor : Color = .yellow
    
    @State var myArc : MyArc = MyArc()
    @State private var navigate : Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
            
            Circle()
                .strokeBorder(lineWidth: 24)
                .frame(width: 250, height: 250)
            
            myArc.foregroundColor(.yellow)
            
            Text("\(timeRemaining) seconds remaining")
                .foregroundColor(textColor)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                        myArc.fin = (359*(Double(timeRemaining)/Double(game.time_limit)))
                    } else {
                        //game = Game(lower_bound: lower_bound, upper_bound: upper_bound, time_limit: time_limit, operation: operation, score: score)
                        //games.append(game)
                        navigate = true
                    }
                    if timeRemaining < 11 {
                        textColor = .red
                    }
                    
                }
        }
        .onAppear(){
            timeRemaining = game.time_limit
            myArc = MyArc()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        TimerView(games: .constant([game]), game: .constant(game))
    }
}

struct MyArc : Shape {
    var fin : Double = 359
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()

        p.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: 113, startAngle: .degrees(0), endAngle: .degrees(fin), clockwise: false)

        return p.strokedPath(.init(lineWidth: 12, dash: [5, 3], dashPhase: 10))
    }
}
