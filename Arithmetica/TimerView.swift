//
//  TimerView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct TimerView: View {
    @Binding var time_limit : Int
    @Binding var score : Int
    
    @State var timeRemaining : Int = 20
    @State var textColor : Color = .yellow
    
    @State var myArc : MyArc = MyArc()
    @State private var navigate : Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
            NavigationLink(destination: ResultsView(score: $score), isActive: $navigate) { EmptyView() }
            
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
        TimerView(time_limit: .constant(5), score: .constant(5), timeRemaining: 10)
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
