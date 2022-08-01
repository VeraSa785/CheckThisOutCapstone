//
//  UserTextField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/31/22.
//

import SwiftUI

struct UserTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.2)))
            .cornerRadius(20)
            .foregroundColor(.black)
        
    }
}

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            UserTextField(text: .constant(""), placeholder: "User")
        }
    }
}
