//
//  TableViewRow.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import SwiftUI

struct TableViewRow: View {
    var title: String
    var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable(resizingMode: .stretch)
                .clipShape(Circle())
                .frame(width: 57, height: 57)
                .padding(.leading)
    
            Text(title)
            
            Spacer()
        }
        
    }
}

struct TableViewRow_Previews: PreviewProvider {
    static var previews: some View {
        TableViewRow(title: "TITULO", image: "test")
    }
}
