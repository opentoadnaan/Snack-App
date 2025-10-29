//
//  CollectionView.swift
//  Snack App
//
//  Created by Air on 29/10/25.
//

import SwiftUI

struct CollectionView: View{
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Text("Order From the Best OF **Snacksss**")
                        .font(.system(size: 30))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.3))
                    }
                    .foregroundColor(.black)
                }
                .padding(30)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],content:{
                    ForEach(productList, id: \.id){item in
                        SmallProductCard(product: item)
                            .environmentObject(cartManager)
                    }
                })
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())

}

struct SmallProductCard: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var product: Product
    
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFill()
                .padding(.trailing, -170)
                .rotationEffect(Angle(degrees: 10))
                .opacity(0.6)
            ZStack{
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 140, alignment: .leading)
                    
                    Text(product.category)
                        .font(.system(size:10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                        .frame(alignment:.leading)
                    
                    Spacer()
                    
                    HStack{
                        Text("₹\(product.price).0")
                            .font(.system(size: 14,weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 40, height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                            
                        }
                        
                    }
                    
                    .padding(.trailing,-12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height:  45)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                } )
            }
            .padding(30)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading,10)
    }
}
