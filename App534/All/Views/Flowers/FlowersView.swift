//
//  FlowersView.swift
//  App534
//
//  Created by IGOR on 26/09/2024.
//

import SwiftUI

struct FlowersView: View {
    
    @StateObject var viewModel = FlowersViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Flowers")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                    VStack(spacing: 8) {
                        
                        Text("\(viewModel.totalFlowers)")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text("Total flowers")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                .padding(.bottom, 8)
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Search")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.search.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.search)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    })
                }
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.4)))
                .padding(.vertical, 8)
                
                if viewModel.flowers.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Text("Add flower")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.fetchCoursesBySearch(), id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedFlower = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                    
                                    VStack(alignment: .leading, spacing: 9) {
                                        
                                        Text("\(index.flAmount ?? "")")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text(index.flName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Text(index.flSupp ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(5)
                                            .padding(.horizontal, 4)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                        
                                    }
                                        
                                        Spacer()
                                        
                                        Text("\(index.flPrice ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                })
                            }
                        }
                    }
                    
                }
 
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFlowers()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddFlower(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            FlowerDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    FlowersView()
}
