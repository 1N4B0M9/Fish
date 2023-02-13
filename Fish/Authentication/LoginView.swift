//
//  LoginView.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 1/30/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var userInfo : UserInfo
    @Binding var viewState : ViewState
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Button {
                    viewState = .authentication
                } label : {
                    Text("Back")
                        .font(Constants.buttonFont)
                        .frame(width: 60, height: 20)
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(20)
                        
                }.padding(.trailing, 300)
                
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                Spacer()
                TextField("username or email", text: $userInfo.username)
                    .font(Constants.textFont)
                    .padding()
                    .foregroundColor(Color.black)
                SecureField("password", text: $userInfo.password)
                    .font(Constants.textFont)
                    .padding()
                    .foregroundColor(Color.black)
                    
                
                Button {
                    
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password) { user, error in
                        if let _ = user {
                            userInfo.loggedIn = true
                            viewState = .list
                        }
                        else {
                            print(error?.localizedDescription)
                        }
                    }
                    
                } label : {
                    Text("Login")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(20)
                }.padding()
                Button {
                    viewState = .forgotPassword
                    
                } label : {
                    Text("Forgot Password")
                        .font(Constants.buttonFont)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(20)
                }.padding()
                Spacer()
                
            }

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView( viewState: Binding.constant(.login))
    }
}
