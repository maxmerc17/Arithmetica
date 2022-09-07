//
//  TimerView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct TimerView: View {
    @Binding var games : [Game]
    
    @Binding var time_limit : Int
    @Binding var score : Int
    
    // to be passed to results view
    @State private var game : Game = Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)
    @Binding var operation: Operator
    @Binding var lower_bound : Int
    @Binding var upper_bound : Int
    
    @State var timeRemaining : Int = 20
    @State var textColor : Color = .yellow
    
    @State var myArc : MyArc = MyArc()
    @State private var navigate : Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
            NavigationLink(destination: ResultsView(games: $games, game: $game), isActive: $navigate) { EmptyView() }
            
            Circle()
                .strokeBorder(lineWidth: 24)
                .frame(width: 250, height: 250)
            
            myArc.foregroundColor(.yellow)
            
            Text("\(timeRemaining) seconds remaining")
                .foregroundColor(textColor)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                        myArc.fin = (359*(Double(timeRemaining)/Double(time_limit)))
                    } else {
                        game = Game(lower_bound: lower_bound, upper_bound: upper_bound, time_limit: time_limit, operation: operation, score: score)
                        //games.append(game)
                        navigate = true
                    }
                    if timeRemaining < 11 {
                        textColor = .red
                    }
                    
                }
        }
        .onAppear(){
            timeRemaining = time_limit
            myArc = MyArc()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(games: .constant([Game(lower_bound: 0, upper_bound: 100, time_limit: 20, operation: .addition, score: 0)]), time_limit: .constant(5), score: .constant(0), operation: .constant(.addition), lower_bound: .constant(0), upper_bound: .constant(100))
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
