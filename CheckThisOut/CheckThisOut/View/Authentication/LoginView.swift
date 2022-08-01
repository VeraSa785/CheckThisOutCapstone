//
//  LoginView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack {
                LogoView()
                    .padding(.bottom, 25)
                
                VStack (spacing: 20) {
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                } //end of VStack
                .padding(.horizontal,30)
                
                HStack {
                    Spacer()
                    Button {
                        //forgot password action
                    } label: {
                        Text("Forgot password")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }// end of HStack
                
                Button {
                    //sign in action
                } label: {
                    AuthenticateButton(text: "Sign In")
                        .padding()
                    
                }
                
                Spacer()
            }//end of VStack
        }//end of ZStack
        
        
        //HStack horisontal stack
        //VStack vertical stack
        //ZStack stack on top in other layer
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

