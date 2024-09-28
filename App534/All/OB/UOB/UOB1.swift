//
//  UOB1.swift
//  App534
//
//  Created by IGOR on 26/09/2024.
//

import SwiftUI

struct UOB1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()

            }
            
            VStack {
                
                
                Spacer()
                
                Text("Easy way to win!")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                
                NavigationLink(destination: {
                    
                    UOR()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    UOB1()
}
