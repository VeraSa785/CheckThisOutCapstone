//
//  BackgroundView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
        }
       
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
