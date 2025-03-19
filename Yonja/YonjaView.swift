//
//  YonjaView.swift
//  Yonja
//
//  Created by Aleyna on 19.03.2025.
//

import SwiftUI

struct YonjaView: View {
    
    @State private var rotate = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<4, id: \.self) { i in
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .frame(width: 50, height:50)
                        .rotationEffect(.degrees(Double(i) * 90))
                        .offset(x:rotate ? 0 : -50, y: rotate ? 0 : -50)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: rotate)
                }
            }
            .onAppear{
                self.rotate.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 7 ) {
                    self.rotate = false
                }
            }
        }
    }
}

struct YonjaView_Previews: PreviewProvider{
    static var previews: some View {
        YonjaView()
    }
}
