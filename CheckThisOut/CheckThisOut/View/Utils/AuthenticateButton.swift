//
//  AuthenticateButton.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/31/22.
//

import SwiftUI

struct AuthenticateButton: View {
        
        let text: String
        
        var body: some View {
          
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 360, height: 50)
                .background(Color.green.opacity(0.8))
                .clipShape(Capsule())
        }
}

struct AuthenticateButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateButton(text: "Sign In")
    }
}
