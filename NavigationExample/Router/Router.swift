//
//  Router.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 01.09.2023.
//

import Foundation

class Router: ObservableObject {
    enum Route {
        case home
        case details
    }
    @Published var currentRoute: Route = .home
    public func navigate(to route: Route) {
        currentRoute = route
    }
}
