//
//  UserInfo.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 2/9/23.
//
import Foundation
import FirebaseAuth
class UserInfo : ObservableObject{
    @Published var username : String
    @Published var password : String
    @Published var loggedIn : Bool = false
    
    init(username : String = "", password : String = "") {
        self.username = username
        self.password = password
        Auth.auth().addStateDidChangeListener {_, user in
            guard let user = user  else {return}
            self.username = user.email ?? ""
            self.loggedIn = true
        }
        
    }
    
}
