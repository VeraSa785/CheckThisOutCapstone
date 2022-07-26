//
//  LoginView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack {
                LogoView()
            }
        }
        
        
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
