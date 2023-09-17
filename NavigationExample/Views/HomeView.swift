//
//  HomeView.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 01.09.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var name: String = ""
    @ObservedObject var presenter: GreetingPresenter
    var body: some View {
        VStack {
            Text("Logged in as user:")
            TextField("Name", text: $name)
                .padding()
                .textFieldStyle(.roundedBorder)
            Button("Generate greating") {
                presenter.generateGreeting(for: name)
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(8)
            Text(presenter.greeting)
                .padding()
                .frame(width: 200, height: 50)
                .border(.gray, width: 1)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userInfo = UserInfo()
        HomeView(presenter: GreetingPresenter(interactor: Interactor())).environmentObject(userInfo)
    }
}
