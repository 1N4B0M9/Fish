//
//  ContentView.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 1/18/23.
//

import SwiftUI
import FirebaseAuth
import struct Kingfisher.KFImage

struct ContentView: View {
    @StateObject var fetch = FetchData()
    @EnvironmentObject var userInfo : UserInfo
    @State var viewState : ViewState = .authentication
    var body: some View {
        if viewState == .authentication && !userInfo.loggedIn {
            AuthenticationView(viewState: $viewState)
        }
        else if viewState == .login && !userInfo.loggedIn{
            LoginView( viewState: $viewState)
        }
        else if viewState == .signUp && !userInfo.loggedIn {
            SignUp( viewState: $viewState)
        }
        else if viewState == .forgotPassword {
            ForgotPassword(viewState: $viewState)
        }
        else {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack{
            Button {
                try! Auth.auth().signOut()
                viewState = .authentication
                userInfo.loggedIn = false
                
            } label : {
                Text("Sign Out")
                    .font(Constants.buttonFont)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .cornerRadius(20)
            }.padding()
        NavigationView {
            ScrollView{
                ForEach(fetch.response) { i in
                    NavigationLink {
                        KFImage(URL(string: i.photo.src ?? "Hi"))
                        Text(i.populationStatus?.replacingOccurrences(of: "<li>", with: " ") ?? " ")
                        Text(i.Habitat?.replacingOccurrences(of: "<li>", with: " ") ?? " ")


                        
                    } label : {
                        VStack {
                        Text(i.name)
                            .padding()
                            .font(.title)
                        Text(i.scientificName)
                            .font(.title3)
                        }
                    }
                }
            }
        }
        .task {
        await fetch.getData()
        }
            
        
        }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
