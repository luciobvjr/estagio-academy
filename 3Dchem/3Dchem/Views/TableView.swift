//
//  ContentView.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import SwiftUI

struct TableView: View {
    @StateObject var subjectViewModel = SubjectViewModel()
    
    @State var count = 0
    @State var titleError = "Erro ao carregar título"
    @State var textError = "Erro ao carregar texto"
    
    var body: some View {
        NavigationView {
            if count > 0 {
                VStack(spacing: 20) {
                    ForEach(1...count , id: \.self) {index in
                        let title = subjectViewModel.subjectList?.data[index-1].title
                        let text = subjectViewModel.subjectList?.data[index-1].text
                        
                        NavigationLink(destination: SubjectView(title: title ?? titleError,
                                                                text: text ?? textError)) {
                            TableViewRow(title: title ?? titleError,
                                         image: "test")
                        }
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Matérias")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top)
            } else {
                Text("Ocorreu um erro: Não foi possível carregar as lições")
            }   
        }.onAppear {
            subjectViewModel.parseJSON()
            count = subjectViewModel.subjectsCount()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
