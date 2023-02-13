//
//  SignUp.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 2/9/23.
//

import SwiftUI
import FirebaseAuth
struct SignUp: View {
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
                    Auth.auth().createUser(withEmail: userInfo.username, password: userInfo.password) { user, error in
                        if let _ = user{
                            print("success")
                            viewState = .list
                            userInfo.loggedIn = true
                        }
                        else {
                            print("failure")
                        }
                    }
                    
                } label : {
                    Text("Sign Up")
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(viewState: Binding.constant(.signUp))
    }
}
