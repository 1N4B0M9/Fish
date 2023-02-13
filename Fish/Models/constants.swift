//
//  constants.swift
//  Fish
//
//  Created by Nathan Morelli (student LM) on 2/9/23.
//

import Foundation
import SwiftUI
enum ViewState{
    case list
    case authentication
    case signUp
    case login
    case forgotPassword
    
}
struct Constants {
    static let buttonFont : Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 16) ?? UIFont.systemFont(ofSize: 20))
    static let textFont : Font = Font(UIFont(name: "HelveticaNeue-Thin", size : 20) ?? UIFont.systemFont(ofSize: 20))
    
    
}


