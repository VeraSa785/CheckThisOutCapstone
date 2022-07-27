//
//  PasswordSecureField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/27/22.
//

import SwiftUI

struct PasswordSecureField: View {
    
    @Binding var text:String
    let placeholder: String
    
    var body: some View {
        CustomSecureField(text: $text, placeholder: Text(placeholder))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.2)))
            .cornerRadius(20)
            .foregroundColor(.black)
    }
}

struct PasswordSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            PasswordSecureField(text: .constant(""), placeholder: "Password")
        }
        
    }
}



