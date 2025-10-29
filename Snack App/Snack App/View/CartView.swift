//
//  CartView.swift
//  Snack App
//
//  Created by Air on 29/10/25.
//

import SwiftUI

struct CartView: View{
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Text("Cart")
                        .font(.system(size: 30))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("\(cartManager.products.count)")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                    }
                    .foregroundColor(.black)
                    
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
                
                //Cart Products
                
                VStack(spacing: 20) {
                    ForEach(cartManager.products, id: \.name){ item in
                        CartProductCard(product: item)
                    }
                }
                
                
                //Total Amount
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Delivery Amount")
                        Spacer()
                        Text("Free")
                            .font(.system(size: 24,weight: .semibold))
                    }
                    Divider()
                    Text("Total Amount")
                        .font(.system(size:24))
                    
                    Text("Rs. \(cartManager.total)")
                        .font(.system(size: 36, weight: .semibold))
                }
                .padding(25)
                .frame(maxWidth: .infinity)
                .background(.yellow.opacity(0.5))
                .clipShape(.rect(cornerRadius: 15))
                .padding()
                
                //Button for payment
                
                Button {
                    
                } label: {
                    Text("Make Payment")
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .padding()
                        .background(.blue.opacity(0.7))
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding()
                }
                
            }
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

//Cart Product View
struct CartProductCard: View {
    var product: Product
    var body: some View {
        HStack(alignment: .center, spacing:15){
            Image(systemName: "line.3.horizontal")
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 90, height: 90)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
                .shadow(radius: 10)
            VStack(alignment: .leading, content:{
                Text("\(product.name)")
                    .font(.headline)
                Text(product.category.capitalized)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            Text("₹\(product.price)")
                .padding()
                .background(.yellow .opacity(0.5))
                .clipShape(Capsule())
            
        }
    }
}
