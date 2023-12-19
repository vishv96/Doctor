//
//  Demo1View.swift
//  Doctor
//
//  Created by vinu vijayan on 14/10/23.
//

import SwiftUI

struct Demo1View: View {
    var body: some View {
        VStack {
//            Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
            Text("Music View")
                .foregroundColor(.black)
                .font(Font.system(size: 25, weight: .bold))
        }
    }
}

struct Demo1View_Previews: PreviewProvider {
    static var previews: some View {
        Demo1View()
    }
}
