//
//  AddTrans.swift
//  App534
//
//  Created by IGOR on 28/09/2024.
//

import SwiftUI

struct AddTrans: View {
    
    @StateObject var viewModel: SuppliersViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add transaction")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                back.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("prim"))
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Supplier")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trSup.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trSup)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Putchased")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trPurch.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trPurch)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Total cost")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trTC.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trTC)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trDate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                    }
                    .padding()
                }
                
                Button(action: {
                        
                    viewModel.addTrans()
                    
                    viewModel.trSup = ""
                    viewModel.trPurch = ""
                    viewModel.trTC = ""
                    viewModel.trDate = ""
                    
                    viewModel.fetchTrans()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddTrans = false
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.trSup.isEmpty || viewModel.trPurch.isEmpty || viewModel.trTC.isEmpty || viewModel.trDate.isEmpty ? 0.5 : 1)
                .disabled(viewModel.trSup.isEmpty || viewModel.trPurch.isEmpty || viewModel.trTC.isEmpty || viewModel.trDate.isEmpty ? true : false)
                .padding()
            }
        }
    }
}

#Preview {
    AddTrans(viewModel: SuppliersViewModel())
}
