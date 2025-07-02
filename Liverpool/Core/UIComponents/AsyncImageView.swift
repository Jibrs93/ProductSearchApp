//
//  AsyncImageView.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

struct AsyncImageView: View {
    let urlString: String
    var size: CGSize = CGSize(width: 80, height: 80)
    var cornerRadius: CGFloat = 8

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.gray.opacity(0.1)
                    ProgressView()
                }

            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()

            case .failure(_):
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                }

            @unknown default:
                EmptyView()
            }
        }
        .frame(width: size.width, height: size.height)
        .clipped()
        .cornerRadius(cornerRadius)
    }
}
#Preview {
    AsyncImageView(urlString: "https://via.placeholder.com/150")
}
