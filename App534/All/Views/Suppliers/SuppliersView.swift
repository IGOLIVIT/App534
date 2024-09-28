//
//  SuppliersView.swift
//  App534
//
//  Created by IGOR on 26/09/2024.
//

import SwiftUI

struct SuppliersView: View {
    
    @StateObject var viewModel = SuppliersViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Suppliers")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(spacing: 8) {
                        
                        Text("\(viewModel.amountSuppliers)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Amount of suppliers")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    
                    VStack(spacing: 8) {
                        
                        Text("\(viewModel.netProfit)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Net profit")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isStat = true
                    }
                    
                }, label: {
                    
                    Text("Edit")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                })
                .padding(.bottom, 8)
                
                HStack {
                    
                    Text("Your suppliers")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddSupp = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(5)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    
                }
                
                if viewModel.suppliers.isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text("You don't have any suppliers")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(height: 120)
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                        
                        ForEach(viewModel.suppliers, id: \.self) { index in
                                                            
                            Button(action: {
                                
                                viewModel.selectedSupp = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 9) {
                                    
                                    Text("\(index.supAmount ?? "") varieties")
                                        .foregroundColor(.black.opacity(0.6))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(index.supName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text(index.supFlow ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(5)
                                        .padding(.horizontal, 4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                }
                                .padding()
                                .frame(width: 180)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            })
                            }
                        }
                    }
                    .frame(height: 120)
                }
                
                HStack {
                    
                    Text("Transactions")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddTrans = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(5)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    
                }
                .padding(.bottom, 7)
                
                if viewModel.transactions.isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        Text("You don't have any transactions")
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.transactions, id: \.self) { index in
                                
                                VStack(spacing: 8) {
                                    
                                    HStack {
                                        
                                        Text(index.trSup ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Text("$ \(index.trTC ?? "")")
                                            .foregroundColor(.red)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.trPurch ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(5)
                                            .padding(.horizontal, 4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                        
                                        Spacer()
                                        
                                        Text("\(index.trDate ?? "")")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .medium))
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                }
 
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isStat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isStat = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isStat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Edit")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text("Amount suppliers")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addAS.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addAS)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        
                        Spacer()
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    
                    HStack {
                        
                        Text("Net Profit")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addNP.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addNP)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))

                        Button(action: {
                                                        
                            viewModel.amountSuppliers = Int(viewModel.addAS) ?? 0
                            viewModel.netProfit = Int(viewModel.addNP) ?? 0

                            withAnimation(.spring()) {
                                
                                viewModel.isStat = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                            
                        })
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isStat ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchSupps()
        }
        .onAppear {
            
            viewModel.fetchTrans()
        }
        .sheet(isPresented: $viewModel.isAddSupp, content: {
            
            AddSupp(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddTrans, content: {
            
            AddTrans(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            SuppDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    SuppliersView()
}
