//
//  EmailTextField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.


import SwiftUI

struct EmailTextField: View {

    @Binding var text: String

    var body: some View {

        CustomTextField(text: $text, placeholder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.2)))
            .cornerRadius(30)
            .foregroundColor(.black)
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            EmailTextField(text: .constant("Email"))
        }
        
    }
}
