//
//  TimerView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct TimerView: View {
    @Binding var game : Game
    @Binding var isPresentingGame : Bool
    @Binding var isPresentingResults : Bool
    
    @State var myArc : MyArc = MyArc()
    @State var timeRemaining : Int = 20
    @State var textColor : Color = .yellow
    
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
                    } else if timeRemaining == 0 {
                        if isPresentingGame == true {
                            isPresentingGame = false
                            isPresentingResults = true
                            timer.upstream.connect().cancel()
                        }else {
                            timer.upstream.connect().cancel()
                        }
                        
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
        .navigationBarBackButtonHidden(true)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let game : Game = Game(data: Game.Data())
        TimerView(game: .constant(game), isPresentingGame: .constant(true), isPresentingResults: .constant(false))
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
