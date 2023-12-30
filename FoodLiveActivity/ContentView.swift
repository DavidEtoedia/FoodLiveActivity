//
//  ContentView.swift
//  LiveActivitySample
//
//  Created by Inyene Etoedia on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    
   @State private var food = FoodOrderManger()
    var bgColor = #colorLiteral(red: 0.8768660426, green: 0.8991003036, blue: 0.9292803407, alpha: 1)
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                    .frame(height: 60)
                ScrollView {
                    ForEach(food.foodList) { val in
                        
                        HStack{
                            Image(val.image.rawValue)
                                .resizable()
                                .frame(width: 100, height: 70)
                                .clipShape(Circle())
                              
                            VStack(alignment: .leading) {
                                Text(val.name.rawValue)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                .foregroundColor(.white)
                                Text(val.price.rawValue, format: .currency(code: "GBP"))
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Button {
                                food.add(food: val)
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                            
                            Text(String(val.quantity))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            
                            Button {
                                food.remove(food: val)

                            } label: {
                                  Image(systemName: "minus.circle.fill")
                                      .font(.system(size: 20))
                                      .foregroundColor(.black)
                            }

                          
                            
                          
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background{
                           RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(bgColor))
                                
                        }
                        .padding(.horizontal, 15)
                        
                        
                    }
                }
         
            }
            .background{
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(.white)
            }
            .edgesIgnoringSafeArea(.top)
          Spacer()
                .frame(height: 20)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total")
                        .font(.system(size: 20))
                    .foregroundColor(.gray)
                    Text(food.total, format: .currency(code: "GBP"))
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(.orange)
               
                }
                Spacer()
                Button {
                    food.placeOrder()
                } label: {
                    Text("Place order")
                        .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                }
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.orange)
                }
               

            }
            .padding(.horizontal, 20)
       
        }
        .background(Color.black)
       
    }
}

#Preview {
    ContentView()
}
