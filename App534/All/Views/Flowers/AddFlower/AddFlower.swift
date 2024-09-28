//
//  AddFlower.swift
//  App534
//
//  Created by IGOR on 28/09/2024.
//

import SwiftUI

struct AddFlower: View {

    @StateObject var viewModel: FlowersViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add flower")
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
                                    .opacity(viewModel.flName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.flAmount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flAmount)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        .padding(.bottom, 9)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Price")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.flPrice.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flPrice)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        .padding(.bottom, 9)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.flDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        .padding(.bottom, 9)

                        Text("Suppliers")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                           Menu(content: {
                               
                               ForEach(viewModel.totalSuppliers, id: \.self) { index in
                                   
                                   Button(action: {
                                       
                                       viewModel.curSupp = index
                                       
                                   }, label: {
                                       
                                       Text(index)
                                   })
                               }
                               
                           }, label: {
                               
                               if viewModel.curSupp.isEmpty {
                                   
                                   HStack {
                                       
                                       Text("Supplier")
                                           .foregroundColor(.gray)
                                           .font(.system(size: 14, weight: .regular))
                                       
                                       Spacer()
                                       
                                       Image(systemName: "chevron.right")
                                           .foregroundColor(.gray)
                                           .font(.system(size: 15, weight: .regular))
                                       
                                   }
                                   
                               } else {
                                   
                                   HStack {
                                       
                                       Text(viewModel.curSupp)
                                           .foregroundColor(.black)
                                           .font(.system(size: 14, weight: .regular))
                                       
                                       Spacer()
                                       
                                       Image(systemName: "chevron.right")
                                           .foregroundColor(.gray)
                                           .font(.system(size: 15, weight: .regular))
                                       
                                   }
                                   
                               }
                               
                           })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))

                    }
                    .padding()
                }
                
                Button(action: {
                    
                    viewModel.totalFlowers += 1
   
                    viewModel.flSupp = viewModel.curSupp
                    
                    viewModel.addFlower()
                    
                    viewModel.flName = ""
                    viewModel.flAmount = ""
                    viewModel.flDescr = ""
                    viewModel.flPrice = ""
                    viewModel.curSupp = ""
                    
                    viewModel.fetchFlowers()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.flName.isEmpty || viewModel.flAmount.isEmpty || viewModel.flPrice.isEmpty || viewModel.flDescr.isEmpty || viewModel.curSupp.isEmpty ? 0.5 : 1)
                .disabled(viewModel.flName.isEmpty || viewModel.flAmount.isEmpty || viewModel.flPrice.isEmpty || viewModel.flDescr.isEmpty || viewModel.curSupp.isEmpty ? true : false)
                .padding()
            }
        }
    }
}

#Preview {
    AddFlower(viewModel: FlowersViewModel())
}
