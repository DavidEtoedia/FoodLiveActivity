//
//  OrderAttributes.swift
//  LiveActivitySample
//
//  Created by Inyene Etoedia on 22/12/2023.
//

import Foundation
import ActivityKit

struct OrderAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        
        enum OrderStatus: CGFloat, Hashable, Codable, RawRepresentable {
            case orderRecieved = 0.75
            case preparingOrder = 1.68
            case orderReady = 2.62
            case riderAccepted = 3.53
            case riderAtVendor = 4.42
            case inTransit = 5.35
            case orderArrived = 6.30
            case orderDelivered = 7.27
            
            
            // Implement RawRepresentable methods
               init?(rawValue: CGFloat) {
                   switch rawValue {
                       case  0.75: self = .orderRecieved
                       case 1.68: self = .preparingOrder
                   case 2.62: self = .orderReady
                   case 3.53: self = .riderAccepted
                   case 4.42: self = .riderAtVendor
                   case 5.35: self = .inTransit
                   case 6.30: self = .orderArrived
                       case 7.27: self = .orderDelivered
                   default:
                       return nil
                   }
               }
            
            var rawValue: CGFloat {
                  switch self {
                
                      case .orderRecieved : return  0.75
                      case .preparingOrder: return 1.68
                  case .orderReady: return 2.62
                  case .riderAccepted: return 3.53
                  case .riderAtVendor: return 4.42
                  case .inTransit: return 5.35
                  case .orderArrived: return 6.30
                      case .orderDelivered: return 7.27
                  }
              }
         
            var title: String {
                switch self {
                 
                    case .orderRecieved:
                        return "Order recieved"
                    case .preparingOrder:
                        return "Preparing your order"
                    case .orderReady:
                        return "Order is ready"
                    case .riderAccepted:
                        return "Rider Accepted order"
                    case .riderAtVendor:
                        return "Rider At The Vendor"
                    case .inTransit:
                        return "Order in transit"
                    case .orderArrived:
                        return "Order Arrived"
                    case .orderDelivered:
                        return "Order Delivered"
                  
                }
            }
            var leadingTitle: Int {
                switch self {
                 
                    case .orderRecieved:
                        return 1
                    case .preparingOrder:
                        return 2
                    case .orderReady:
                        return 3
                    case .riderAccepted:
                        return 4
                    case .riderAtVendor:
                        return 5
                    case .inTransit:
                        return 6
                    case .orderArrived:
                        return 7
                    case .orderDelivered:
                        return 8
                  
                }
            }
            
            var description: String {
                switch self {
                  
                    case .orderRecieved:
                        return "Waiting for vendor to confirm your order"
                    case .preparingOrder:
                        return "Your order will be ready in"
                    case .orderReady:
                        return "Your order is ready for pickup"
                    case .riderAccepted:
                        return "Your order has been assigned to a rider"
                    case .riderAtVendor:
                        return "Your rider has arrived at the vendor to pick up your order"
                    case .inTransit:
                        return "Your order is on its way"
                    case .orderArrived:
                        return "Your rider is around to deliver your order"
                    case .orderDelivered:
                        return "Enjoy your meal, don’t forget to rate your meal"
                  
                }
            }
            
            var image: String {
                switch self {
                   
                    case .orderRecieved:
                        return "cart"
                    case .preparingOrder:
                        return "preparing_food"
                    case .orderReady:
                        return "order_ready"
                    case .riderAccepted:
                        return "rider_accepted"
                    case .riderAtVendor:
                        return "rider_at_vendor"
                    case .inTransit:
                        return "inTransit"
                    case .orderArrived:
                        return "order_arrived"
                    case .orderDelivered:
                        return "delivered"
                  
                }
            }
            
        
        }
        let status: OrderStatus
        
        init(status: OrderStatus = .orderRecieved) {
            self.status = status
        }
       
    }
    
    let orderNumer: Int
    
}




extension OrderAttributes {
     static var preview: OrderAttributes {
        OrderAttributes(orderNumer: 1)
    }
}

extension OrderAttributes.ContentState {
 
    static var orderRecieved: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .orderRecieved)
    }
     static var preparingOrder: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .preparingOrder)
    }
     
     static var ready: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .orderReady)
    }
     static var riderAccepted: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .riderAccepted)
    }
     static var riderAtVendor: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .riderAtVendor)
    }
     static var riderInTransit: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .inTransit)
    }
     static var orderArrived: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .orderArrived)
    }
     static var orderDelivered: OrderAttributes.ContentState {
        OrderAttributes.ContentState(status: .orderDelivered)
    }
}


