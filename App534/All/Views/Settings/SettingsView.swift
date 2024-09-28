//
//  SettingsView.swift
//  App534
//
//  Created by IGOR on 26/09/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/3b1db866-c40d-411c-825a-fee178ba2713") else { return }
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                    })
                }
                
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
