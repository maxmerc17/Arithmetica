//
//  Template.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct TemplateView: View {
    @State var data = Data()
    var body: some View {
        VStack {
            ZStack {
                ForEach(data.points) { point in
                    HStack {
                        Circle().frame(width: 5, height: 5)
                    }.position(CGPoint(x: point.x, y: point.y))
                }
            }
            Path {
                path in
                
                path.move(to: CGPoint(x: 170-100, y: 200-100))
                
                for point in data.points{
                    path.addLine(to: CGPoint(x: point.x, y: point.y))
                }
            }.fill(.black)
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}


struct Point : Identifiable {
    var id : UUID
    var x : Double
    var y : Double
    
    init(id: UUID = UUID(), x: Double, y: Double){
        self.id = id
        self.x = x
        self.y = y
    }
}

struct Data {
    var points : [Point] = []
    
    init() {
        var newPoints : [Point] = []
        
        let midX : Double = 220
        let midY : Double = 100
        let radius : Double = 100
        
        for i in -Int(radius)...Int(radius) {
            let newX = Double(i)
            let newY = Double(sqrt(pow(radius,2) - pow(newX,2)))
            newPoints.append(Point(x: newX+midX, y: newY+midY))
            //newPoints.append(Point(x: newX+midX, y: (-newY+midY)))
        }
        
        self.points = newPoints
    }
}

