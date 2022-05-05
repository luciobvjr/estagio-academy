//
//  ContentView.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import SwiftUI

struct TableView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach(1...5 , id: \.self) {_ in
                    TableViewRow(title: "TITULO", image: "test")
                }

                Spacer()
            }.navigationTitle("Matérias")
//            SubjectView(title: "A", text: "BBNDF")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
