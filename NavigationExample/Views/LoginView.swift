//
//  LoginView.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 17.09.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        Button("Log In") {
            userInfo.isUserAuthenticated = .signedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let userInfo = UserInfo()
        LoginView().environmentObject(userInfo)
    }
}
