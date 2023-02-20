//
//  UserModel.swift
//  TutoYoutube
//
//  Created by Abdoulaye Aliou SALL on 18/02/2023.
//

import Foundation
import SwiftUI


struct UserModel : Decodable {
    let id : Int
    let prenom : String
    let nom : String
    let email: String
    let role : String
    let motDePasse: String
    
}
