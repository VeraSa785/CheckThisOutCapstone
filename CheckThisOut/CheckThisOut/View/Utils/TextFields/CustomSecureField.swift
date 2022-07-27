//
//  CustomSecureField.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/27/22.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .fontWeight(.bold)
                    .foregroundColor(Color(.init(white: 0.4, alpha: 0.5)))
                    .padding(.leading, 30)
                
            }//end of Zstack
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.init(white: 0.4, alpha: 0.5)))
                
                SecureField("", text:$text)
                    .autocapitalization(.none)
            }//end of Hstack
            
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            CustomSecureField(text: .constant(""), placeholder: Text("Password"))
        }
    }
}
