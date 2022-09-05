//
//  ErrorWrapper.swift
//  Arithmetica
//
//  Created by Max Mercer on 2022-09-05.
//

import Foundation

struct ImproperInputWrapper: Identifiable {
    let id: UUID
    let title: String
    let guidance: String

    init(id: UUID = UUID(), title: String, guidance: String) {
        self.id = id
        self.title = title
        self.guidance = guidance
    }
}
