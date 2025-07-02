//
//  SearchBarView.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var placeholder: String = "Buscar producto"
    var onSearch: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(placeholder, text: $text, onCommit: {
                onSearch()
            })
            .textFieldStyle(PlainTextFieldStyle())
            .submitLabel(.search)
            .accentColor(Color.mainColorLiverpool)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                    onSearch()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
#Preview {
    SearchBarView(text: .constant(""), onSearch: { })
}
