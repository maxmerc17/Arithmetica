//
//  WelcomeView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//


// idea to improve welome view -- remove sections and headers, make icons blue, make dropdowns black

import SwiftUI

struct WelcomeView: View {
    
    //@FocusState private var lowerBoundFieldIsFocused : Bool
    @State private var lower_bound: String = ""
    @State private var upper_bound: String = ""
    
    @State private var selectedOperator : Operator = .addition
    
    @State private var time_limit: String = ""
    
    @State private var lower_bounds : [Int] = [0, 10, 50, 100, 500, 1000]
    @State private var upperbounds : [Int] = [10, 50, 100, 500, 1000, 100000]
    @State private var time_limits : [Int] = [20, 40, 60, 120, 300, 600]
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.yellow)
                Text("High Score:").font(.headline)
            }.fixedSize(horizontal: false, vertical: true).padding()
            
            Text("Welcome to Arithmetica").font(.largeTitle).bold().padding().frame(width: 300, height: 200, alignment: .center)
            
            //Text("Bounds for terms: ").font(.subheadline).padding()
            
            Section(header: Text("Bounds for terms:").font(.subheadline).padding()){
                HStack {
                    Label("Lower Bound", systemImage: "arrow.down")
                    Picker("Lower Bound", selection: $lower_bound) {
                        ForEach(lower_bounds, id: \.self) {
                            value in Text("\(value)")
                        }
                    }
                }
                HStack {
                    Label("Upper Bound", systemImage: "arrow.up")
                    Picker("Lower Bound", selection: $lower_bound) {
                        ForEach(lower_bounds, id: \.self) {
                            value in Text("\(value)")
                        }
                    }
                }
            }
            Section(header: Text("Mathematical Operator: ").font(.subheadline).padding()){
                Picker("Operator", selection: $selectedOperator) {
                    ForEach(Operator.allCases, id: \.self) {
                        value in Label("\(value.rawValue)", systemImage: value.systemImage).labelStyle(.trailingIcon)
                    }.padding()
                }.foregroundColor(.black)
        
            }
            
            Section(header: Text("Time Limit: ").font(.subheadline).padding()){
                HStack {
                    Label("Time in seconds", systemImage: "clock")
                    Picker("Operator", selection: $selectedOperator) {
                        ForEach(time_limits, id: \.self) {
                            value in Text("\(value)") }
                    }
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                Text(" ").font(.headline)
            }.fixedSize(horizontal: false, vertical: true).padding()
            /*
            TextField(
                    "Minimum value of a term",
                    text: $lower_bound
                )
                .focused($lowerBoundFieldIsFocused)
                .onSubmit {
                    //validate(name: username)
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding()

                Text(lower_bound)
                    .foregroundColor(lowerBoundFieldIsFocused ? .red : .blue)
             */
            
        }//.background(.cyan)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
