//
//  Interactor.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 02.09.2023.
//

import Foundation

class Interactor {
    func generateGreeting(for name: String, completion: @escaping(Result<String, Error>) -> Void) {
        if name.isEmpty {
            completion(.success("Hello, unknown"))
            return
        }
        completion(.success("Hello, \(name)"))
    }
}
