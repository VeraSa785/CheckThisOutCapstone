//
//  ListTextField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct ListTextField: View {

    @Binding var text:String
    let placeholder: String

    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark.square", foregroundColor: .gray)
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
            
    }
}

struct ListTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ListTextField(text: .constant(""), placeholder: "Title")
        }
    }
}
