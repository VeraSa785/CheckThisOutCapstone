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
        
        NavigationView {
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
                    
                    NavigationLink(
                        destination: SignupView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.black)
                            .padding(.bottom,14)
                        }
                    )

                    
                }//end of VStack
                .padding(.top, -44)
            }
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

