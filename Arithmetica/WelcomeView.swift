//
//  WelcomeView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-02.
//


// idea to improve welome view -- remove sections and headers, make icons blue, make dropdowns black

import SwiftUI

struct WelcomeView: View {
    
    @State private var highScore: Int = 0
    
    //@FocusState private var lowerBoundFieldIsFocused : Bool
    @State private var lower_bound : Int = 0
    @State private var s_lower_bound : Int = 0
    @State private var upper_bound : Int = 100
    @State private var s_upper_bound : Int = 100
    
    @State private var selectedOperator : Operator = .addition
    
    @State private var selectedTime: Int = 20
    
    @State private var lower_bounds : [Int] = [0, 10, 50, 100, 500, 1000]
    @State private var upper_bounds : [Int] = [10, 50, 100, 500, 1000, 100000]
    @State private var time_limits : [Int] = [20, 40, 60, 120, 300, 600]
    
    @State private var showingPopover = false
    @Environment(\.dismiss) private var dismiss
    @State private var improperInput : ImproperInputWrapper?
    
    
    var body: some View {
        
        VStack{
            
            VStack(alignment: .center) {
                Text("           Welcome to\n") +
                Text("A").font(.largeTitle).bold().foregroundColor(.red) +
                Text("r").font(.largeTitle).bold().foregroundColor(.blue) +
                Text("i").font(.largeTitle).bold().foregroundColor(.green) +
                Text("t").font(.largeTitle).bold().foregroundColor(.purple) +
                Text("h").font(.largeTitle).bold().foregroundColor(.red) +
                Text("m").font(.largeTitle).bold().foregroundColor(.blue) +
                Text("e").font(.largeTitle).bold().foregroundColor(.green) +
                Text("t").font(.largeTitle).bold().foregroundColor(.purple) +
                Text("i").font(.largeTitle).bold().foregroundColor(.red) +
                Text("c").font(.largeTitle).bold().foregroundColor(.blue) +
                Text("a").font(.largeTitle).bold().foregroundColor(.green)
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.yellow)
                HStack {
                    Text("High Score: \(highScore)").font(.headline)
                    Text("(\(selectedOperator.rawValue), values between \(lower_bound) and \(upper_bound), \(selectedTime) second games)").font(.caption2)
                }
            }.fixedSize(horizontal: false, vertical: true).padding()
            
            
            VStack(alignment: .trailing){
                HStack {
                    Label("Lower Bound", systemImage: "arrow.down")
                    Picker("Lower Bound", selection: $s_lower_bound) {
                        ForEach(lower_bounds, id: \.self) {
                            value in Text("\(value)").tag(value)
                        }
                    }.onChange(of: s_lower_bound) { s_lower_bound in
                        print("Lower bound is \(s_lower_bound)")
                        if s_lower_bound >= upper_bound {
                            self.s_lower_bound = lower_bound
                            improperInput = ImproperInputWrapper(title: "Lower bound cannot be greater than or equal to upper bound.", guidance: "Set a lower bound less than the upper bound.")
                            showingPopover = true
                            
                        } else {
                            self.lower_bound = s_lower_bound
                        }
                    }
                }
                HStack {
                    Label("Upper Bound", systemImage: "arrow.up")
                    Picker("Upper Bound", selection: $s_upper_bound) {
                        ForEach(upper_bounds, id: \.self) {
                            value in Text("\(value)").tag(value)
                        }
                    }.onChange(of: s_upper_bound) { s_upper_bound in
                        if lower_bound >= s_upper_bound {
                            self.s_upper_bound = upper_bound
                            improperInput = ImproperInputWrapper(title: "Upper bound cannot be less than or equal to lower bound.", guidance: "Set an upper bound greater than the lower bound.")
                            showingPopover = true
                            
                        } else {
                            self.upper_bound = s_upper_bound
                        }
                    }
                }
                
                HStack {
                    Label("Time in seconds", systemImage: "clock")
                    Picker("select time", selection: $selectedTime) {
                        ForEach(time_limits, id: \.self) {
                            value in Text("\(value)").tag(value) }
                    }
                }
                
                HStack {
                    Label("Operation", systemImage: "x.squareroot")
                    Picker("Operator", selection: $selectedOperator) {
                        ForEach(Operator.allCases, id: \.self) {
                            value in Text("\(value.rawValue)")
                        }.padding()
                    }
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green)
                NavigationLink(destination: GameView(selectedOperator: $selectedOperator, lower_bound: $lower_bound, upper_bound: $upper_bound, time_limit: $selectedTime )){
                    Text("Play!").foregroundColor(.black).font(.headline)
                }
                
            }.fixedSize(horizontal: false, vertical: true).padding()
                
            
            HStack {
                Image(systemName: "plus").resizable()
                    .frame(width: 32.0, height: 32.0).foregroundColor(.red).padding()
                Image(systemName: "multiply").resizable()
                    .frame(width: 32.0, height: 32.0).foregroundColor(.blue).padding()
                Image(systemName: "minus").resizable()
                    .frame(width: 32.0, height: 5.0).foregroundColor(.green).padding()
                Image(systemName: "divide").resizable()
                    .frame(width: 32.0, height: 32.0).foregroundColor(.purple).padding()
            }.padding()
            
            NavigationLink(destination: AboutView()){
                Text("About").foregroundColor(.blue)
            }
            .popover(item: $improperInput) { wrapper in
                ImproperInputView(inputWrapper: wrapper)
            }
        
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


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
