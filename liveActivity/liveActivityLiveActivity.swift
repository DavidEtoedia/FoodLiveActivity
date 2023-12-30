//
//  liveActivityLiveActivity.swift
//  liveActivity
//
//  Created by Inyene Etoedia on 30/12/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI



struct liveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OrderAttributes.self) { context in
            // Lock screen/banner UI goes here
            
            LiveActivityView(states: context.state)
            

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                 
                }
                DynamicIslandExpandedRegion(.trailing) {
                   // Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    ExpandedDynamic(states: context.state)
                }
            } compactLeading: {
                Text("\(context.state.status.leadingTitle)/8")
            } compactTrailing: {
                Image(context.state.status.image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .id(context.state.status.image)
            } minimal: {
               Image("logo2")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}



#Preview("Notification", as: .content, using: OrderAttributes.preview) {
    liveActivityLiveActivity()
} contentStates: {
    OrderAttributes.ContentState.orderRecieved
    OrderAttributes.ContentState.preparingOrder
    OrderAttributes.ContentState.ready
    OrderAttributes.ContentState.riderAccepted
    OrderAttributes.ContentState.riderAtVendor
    OrderAttributes.ContentState.riderInTransit
    OrderAttributes.ContentState.orderArrived
    OrderAttributes.ContentState.orderDelivered
}



struct ExpandedDynamic : View{
    @State var states: OrderAttributes.ContentState
    var body: some View{
        VStack{
            HStack(alignment: .center){
                VStack(alignment: .leading){
                    Text("\(states.status.title)")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                        .frame(height: 5)
                    if(states.status.title == "Preparing your order"){
                        HStack {
                            Text("\(states.status.description)")
                                .font(.system(size: 11, weight: .light))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(nil)
                            .padding(.bottom)
                            Text("40:00")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.yellow)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(nil)
                            .padding(.bottom)
                        }
                    }
                    else{
                        Text("\(states.status.description)")
                            .font(.system(size: 11, weight: .light))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                           
                    }
                   
                }
                Spacer()
                Image(states.status.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .id(states.status.image)
                    .transition(.push(from: .bottom))
                   
            
            }
            .padding(.leading, 20)
        }
    }
    
}













