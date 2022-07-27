//
//  CustomTextField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var foregroundColor: Color?
    
    var body: some View {
        
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .foregroundColor(foregroundColor ?? Color(.init(white: 0.4, alpha: 0.5)) )
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                }
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? Color(.init(white: 0.4, alpha: 0.5)) )
                    
                
                TextField("", text: $text)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            BackgroundView()
            CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName:"envelope")
        }
    }
}

