//
//  File.swift
//  LiveActivitySample
//
//  Created by Inyene Etoedia on 22/12/2023.
//

import Foundation
import ActivityKit


final class LiveActivityManager {
    let orderAttribute: OrderAttributes
    var orderActivity: Activity<OrderAttributes>?
    static let shared = LiveActivityManager()
    
    
    private init() {
       orderAttribute = OrderAttributes(orderNumer: 8)
        setUpActivity()
    }
    
    func simulate(){
        setUpActivity()
        Task{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            await updateActivity(to: .init())
            try await Task.sleep(nanoseconds: 1_000_000_000)
            await updateActivity(to: .init())
            print("About to take order")
            try await Task.sleep(nanoseconds: 1_000_000_000)
            await updateActivity(to: .init( status: .orderRecieved))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("Making order")
            await updateActivity(to: .init( status: .preparingOrder))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("preparingOrder")
            await updateActivity(to: .init(status: .orderReady))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("orderReady")
            await updateActivity(to: .init(status: .riderAccepted))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("riderAccepted")
            await updateActivity(to: .init(status: .riderAtVendor))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("riderAtVendor")
            await updateActivity(to: .init(status: .inTransit))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("inTransit")
            await updateActivity(to: .init(status: .orderArrived))
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("orderArrived")
            await updateActivity(to: .init(status: .orderDelivered))
            try await Task.sleep(nanoseconds: 2_000_000_000)
            print("orderDelivered")
            await orderActivity?.end(ActivityContent(state: OrderAttributes.ContentState.init(status: .orderDelivered), staleDate: nil), dismissalPolicy: .default)
            orderActivity = nil
        }
        
    }
    
    
    
    
  
    
}

private extension LiveActivityManager {
    func setUpActivity(){
        if orderActivity != nil {
            return
        }
        
        let initialState = OrderAttributes.ContentState(status: .orderRecieved)
        let content = ActivityContent(state: initialState , staleDate: nil, relevanceScore: 1.0)
        
        do{
            orderActivity = try Activity.request(
                attributes: orderAttribute,
                content: content,
            pushType: nil
            )
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
    func updateActivity(to state: OrderAttributes.ContentState) async{
        
        var alert : AlertConfiguration?
        
        if state.status == .orderDelivered {
            
            alert = AlertConfiguration(title: "Hey\(state.status.description)", body: "", sound: .default)
        }
        
        await orderActivity?.update(
            ActivityContent(
            state: state,
            staleDate: nil),
            alertConfiguration: alert
        )
        
    }
}


