//
//  LiveActivityView.swift
//  FoodLiveActivity
//
//  Created by Inyene Etoedia on 30/12/2023.
//

import SwiftUI

struct LiveActivityView: View {
    
    
    @State var states: OrderAttributes.ContentState
    var color = #colorLiteral(red: 0.1017824337, green: 0.1691287756, blue: 0.05400187522, alpha: 1)
    var bgColor = #colorLiteral(red: 0.06375184655, green: 0.1053268984, blue: 0.03475476056, alpha: 1)
    
    var body: some View {
        VStack(alignment: .leading) {
            
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
            .padding(.trailing, 20)
            .padding(.top, 20)
            .padding(.bottom, 20)
            
                
            Spacer()
            Rectangle()
                .frame(height: 49)
                .foregroundColor(Color(color))
                .overlay{
                    ZStack {
                        HStack{
                            ForEach(0..<8) { val in
                                Rectangle()
                                    .frame(width: 30, height: 4)
                                    .foregroundColor(.gray.opacity(0.5))
                                    .cornerRadius(20)
                            }
                            Image("logo2")
                                .resizable()
                                .frame(width: 25, height: 25)
 
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                        
                        LinearProgressBar(progress: $states)
                            .zIndex(1)
                            .offset(y: 21)

                        
                    }

                }
             
         
             
            
      
           
        }
        .background(Color(bgColor))
    }
}



#Preview {
    LiveActivityView(states:  OrderAttributes.ContentState.orderRecieved)
}


struct LinearProgressBar: View {
    @Binding var progress: OrderAttributes.ContentState
    

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                Rectangle()
                    .frame(width: CGFloat(self.progress.status.rawValue) * 41, height: 4)
                    .foregroundColor(Color.green)
                .cornerRadius(30)
                
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 7, height: 7)
                    .overlay{
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    }

//                HStack(spacing: 0) {
//                    Rectangle()
//                        .frame(width: CGFloat(self.progress.status.rawValue) * 40, height: 5)
//                        .foregroundColor(Color.blue)
//                    .cornerRadius(30)
//
//                    Circle()
//                        .foregroundColor(.blue)
//                        .frame(width: 9, height: 9)
//                }
            }
        }
        .padding(.leading, 15)
    }
}
