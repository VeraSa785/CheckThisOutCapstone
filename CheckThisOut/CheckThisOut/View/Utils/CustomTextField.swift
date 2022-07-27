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
                    .foregroundColor(foregroundColor ?? Color(.init(gray: 1, alpha: 0.8)) )
                    .padding(.leading, 40)
                }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName:"envelope")
        }
    }
}

