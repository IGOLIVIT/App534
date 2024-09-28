//
//  AddSupp.swift
//  App534
//
//  Created by IGOR on 28/09/2024.
//

import SwiftUI

struct AddSupp: View {

    @StateObject var viewModel: SuppliersViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add supplier")
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
                        
                        Text("Information")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.supName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.supName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Amount of Product")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.supAmount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.supAmount)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        .padding(.bottom, 9)
                        
                        Text("Flowers")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.supFlow.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.supFlow)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))

                    }
                    .padding()
                }
                
                Button(action: {
                    
                    viewModel.totalSuppliers.append(viewModel.supName)
                        
                    viewModel.addSupp()
                    
                    viewModel.supName = ""
                    viewModel.supAmount = ""
                    viewModel.supFlow = ""
                    
                    viewModel.fetchSupps()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddSupp = false
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.supName.isEmpty || viewModel.supAmount.isEmpty || viewModel.supFlow.isEmpty ? 0.5 : 1)
                .disabled(viewModel.supName.isEmpty || viewModel.supAmount.isEmpty || viewModel.supFlow.isEmpty ? true : false)
                .padding()
            }
        }
    }
}

#Preview {
    AddSupp(viewModel: SuppliersViewModel())
}
