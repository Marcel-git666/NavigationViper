//
//  ContentView.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 01.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var router = Router()
    var body: some View {
        NavigationView {
            switch router.currentRoute {
            case .home:
                HomeView(presenter: GreetingPresenter(interactor: Interactor()))
                    .navigationTitle("Home View")
                    .navigationBarItems(trailing: Button(action: {router.navigate(to: .details)}, label: {
                        Text("Details")
                    }))
            case .details:
                DetailView()
                    .navigationTitle("Detail View")
                    .navigationBarItems(trailing: Button(action: {router.navigate(to: .home)}, label: {
                        Text("Home")
                    }))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
