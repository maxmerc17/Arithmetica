//
//  ResultsView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//

import SwiftUI

struct ResultsView: View {
    @Binding var score : Int
    
    var body: some View {
        Text("Well Done, you scored ") + Text("\(score)").foregroundColor(.red) + Text("!")
            
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(score : .constant(5))
    }
}
