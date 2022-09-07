//
//  ArithmeticaApp.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-01.
//

import SwiftUI

@main
struct ArithmeticaApp: App {
    @StateObject private var store = GameStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView(games: $store.games){
                    Task {
                        do {
                            try await GameStore.save(games: store.games)
                        } catch {
                            //errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }
            .onAppear {
                GameStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let games):
                        store.games = games
                    }
                }
            }
        }
    }
}
