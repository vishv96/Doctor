//
//  StyleButton.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct StyleButton: View {
    
    let title: String
    var action: () -> Void
    
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Spacer()
                Text(title)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(height: 50)
            .background(Color.accentColor)
            .cornerRadius(25)
        })
        
    }
}

#Preview {
    StyleButton(title: "Start"){
        
    }
        .padding()
}
