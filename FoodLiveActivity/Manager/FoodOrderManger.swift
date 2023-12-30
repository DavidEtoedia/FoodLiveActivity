//
//  FoodOrderManger.swift
//  LiveActivitySample
//
//  Created by Inyene Etoedia on 29/12/2023.
//

import Foundation


@Observable class FoodOrderManger {
    var foodList: [FoodMenu] = []
   var total: Decimal = 0.0
    
    
    
    init(){
        initList()
    }
    
    func initList(){
         let val = [
            FoodMenu(name: .sandwich, image: .sandwich, price: .small, quantity: 0 ),
            FoodMenu(name: .burger, image: .burger, price: .medium, quantity: 0),
            FoodMenu(name: .shawarma, image: .shawarma, price: .large, quantity: 0),
            FoodMenu(name: .friedChicken, image: .friedChicken, price: .doubleLarge, quantity: 0),
            FoodMenu(name: .croissant, image: .croissant, price: .extraLarge, quantity: 0),
         ]
        foodList.append(contentsOf: val)
    }
    
    func placeOrder() {
        let value = foodList.allSatisfy { $0.quantity == 0 }
        if(value){
            return
        }else{
            LiveActivityManager.shared.simulate()
        }
    }
    

    
    func add(food: FoodMenu){
       if let index = foodList.firstIndex(where: {$0.id == food.id}){
           foodList[index].quantity += 1
           getTotal()
           print( foodList[index].totalPrice)
        }
    }
    
    
    func remove(food: FoodMenu){
       if let index = foodList.firstIndex(where: {$0.id == food.id}){
           if (food.quantity == 0){
               return
           }else {
               foodList[index].quantity -= 1
               getTotal()
               
               
           }
          
        }
    }
    
    func getTotal(){
        
//        foodList.reduce(Decimal(0.0)) { partialResult, val in
//            
//            let result = partialResult + val.totalPrice
//             total = result
//            return result
//        }
        
        total = foodList.reduce(Decimal(0.0)){$0 + $1.totalPrice}
        
    }
    
    
}
