//
//  AppUser.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/3/22.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
