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
                        .padding(.horizontal,30)
                } //end of VStack
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

