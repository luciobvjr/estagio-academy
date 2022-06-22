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
                        let texts = subjectViewModel.subjectList?.data[index-1].texts
                        let images = subjectViewModel.subjectList?.data[index-1].images
                        
                        NavigationLink(destination: SubjectView(title: title ?? titleError,
                                                                texts: texts ?? [textError],
                                                                images: images ?? [])) {
                            TableViewRow(title: title ?? titleError,
                                         image: "test")
                        }
                        .foregroundColor(Color(uiColor: UIColor.systemBackground))
                    }
                    
                    Spacer()
                }
                .navigationTitle("Matérias")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top)
            } else {
                Text("Ocorreu um erro: Não foi possível carregar as lições.")
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
