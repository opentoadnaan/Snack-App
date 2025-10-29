//
//  Home.swift
//  Snack App
//
//  Created by Air on 29/10/25.
//

import  SwiftUI


struct Home: View {
    
    @State var selectedCategory = "All"
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    //header
                    HStack{
                        Text("Order From the Best OF **Snacksss**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.3))
                    }
                    .padding(30)
                    
                    //categoryList
                    CategoryListView
                    
                    //collection View
                    HStack{
                        Text("Choco **Collection**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    //product list
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(productList, id: \.id){item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                    
                }
                
            }
        }
    }
    //CategoryList view
    var CategoryListView: some View{
        HStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(categoryList, id: \.id){ item in
                        Button{
                            selectedCategory = item.title
                        }label: {
                            HStack{
                                if item.title != "All"{
//                                    Image(item.icon)
//                                        .foregroundColor(selectedCategory == item.title ?   .red : .black)
                                }
                            Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(20)
            }
        }
    }
    
}

#Preview{
    Home()
        .environmentObject(CartManager())
}
//Product Card View
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
                .opacity(0.8)
                .shadow(radius: 10)
            ZStack{
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140, alignment: .leading)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                        .frame(alignment:.leading)
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 24,weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product: product)
                            
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                            
                        }
                        .padding(.horizontal, -10)
                        
                    }
                    
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height:  80)
                    .background(.white.opacity(0.8 ))
                    .clipShape(Capsule())
                } )
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading,20)
    }
}
