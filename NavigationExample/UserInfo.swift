//
//  UserInfo.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 14.09.2023.
//

import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined, signedOut, signedIn
    }
    @Published var isUserAuthenticated: FBAuthState = .undefined
    
    func configureFirebaseStateDidChange() {
        self.isUserAuthenticated = .signedOut
//        self.isUserAuthenticated = .signedIn
    }
}
