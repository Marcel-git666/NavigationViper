//
//  ContentView.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 01.09.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    @ObservedObject var router = Router()
    var body: some View {
        Group {
            if userInfo.isUserAuthenticated == .undefined {
                Text("Loading....")
            } else if userInfo.isUserAuthenticated == .signedOut {
                router.currentRoute = .login
            } else {
                router.currentRoute = .home
            }
       
            switch router.currentRoute {
            case .home:
                HomeView(presenter: GreetingPresenter(interactor: Interactor()))
                    .navigationTitle("Home View")
                    .navigationBarItems(
                        leading: Button(action: {router.navigate(to: .details)}, label: {
                            Text("Details")
                        }),
                        trailing: Button(action: {
                            self.userInfo.isUserAuthenticated = .signedOut
                        }) {
                            Text("Log Out")
                        })
            case .details:
                DetailView()
                    .navigationTitle("Detail View")
                    .navigationBarItems(trailing: Button(action: {router.navigate(to: .home)}, label: {
                        Text("Home")
                    }))
            case .login:
                LoginView()
            }
        }
        .onAppear {
            userInfo.configureFirebaseStateDidChange()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userInfo = UserInfo()
        ContentView().environmentObject(userInfo)
    }
}
