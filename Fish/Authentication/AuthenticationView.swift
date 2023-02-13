//
//  AuthenticationView.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 2/9/23.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var viewState : ViewState
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                Spacer()
                Button {
                    viewState = .signUp
                } label : {
                    Text("Sign Up")
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(20)
                }.padding()
                Button {
                    viewState = .login

                } label : {
                    Text("Login")
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

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authentication))
    }
}
