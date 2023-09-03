//
//  Presenter.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 02.09.2023.
//

import Foundation

class GreetingPresenter: ObservableObject {
    public var view: HomeView?
    public let interactor: Interactor
    @Published var greeting: String = ""
    
    init(view: HomeView? = nil, interactor: Interactor) {
        self.view = view
        self.interactor = interactor
    }
    func generateGreeting(for name: String) {
        interactor.generateGreeting(for: name) { [weak self] result in
            switch result {
            case .success(let greeting): self?.greeting = greeting
            case .failure(let error): print("Error generating greeting: \(error.localizedDescription)")
            }
        }
    }
}
