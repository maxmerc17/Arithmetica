//
//  ErrorView.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-05.
//

import SwiftUI

struct ImproperInputView: View {
    let inputWrapper: ImproperInputWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Improper Input")
                    .font(.title)
                    .padding(.bottom)
                Text(inputWrapper.title)
                    .font(.headline)
                Text(inputWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    static var wrapper: ImproperInputWrapper {
        ImproperInputWrapper(title: "Lower bound cannot be greater than uppper bound.",
                     guidance: "Please select a lower bound less than the upper bound.")
    }
    
    static var previews: some View {
        ImproperInputView(inputWrapper: wrapper)
    }
}
