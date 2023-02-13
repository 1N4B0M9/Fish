//
//  ForgotPassword.swift
//  NewWaveStore
//
//  Created by Nathan Morelli (student LM) on 2/6/23.
//

import SwiftUI
import FirebaseAuth
struct ForgotPassword: View {
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
                    
                
                Button {
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) {
                        _ in
                        self.viewState = .authentication
                    }
                    
                } label : {
                    Text("Reset Password")
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

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewState: Binding.constant(.forgotPassword))
    }
}
