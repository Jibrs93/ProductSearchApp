//
//  ProductRowView.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImageView(urlString: product.lgImage ?? "")
                .frame(width: 80, height: 80)

            VStack(alignment: .leading, spacing: 6) {
                // Nombre del producto
                Text(product.productDisplayName ?? "Not Found")
                    .font(.headline)
                    .lineLimit(2)

                // Precios
                priceView()

                // Colores disponibles
                if let variants = product.colorVariants, !variants.isEmpty {
                    HStack(spacing: 6) {
                        ForEach(variants.prefix(6), id: \.colorName) { color in
                            Circle()
                                .fill(Color(hex: color.colorHex ?? "#CCCCCC") ?? .gray)
                                .frame(width: 12, height: 12)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder /// Devolucion de Views (Precio) Distintos
    private func priceView() -> some View {
        if let list = product.listPrice, let promo = product.promoPrice {
            if list == promo {
                Text("**$\(promo, specifier: "%.2f**")")
                    .font(.subheadline)
                    .foregroundColor(.red)
            } else {
                VStack(spacing: 8) {
                    Text("$\(list, specifier: "%.2f")")
                        .font(.subheadline)
                        .strikethrough()
                        .foregroundColor(.secondary)

                    Text("**$\(promo, specifier: "%.2f")**")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
        } else {
            Text("Precio no disponible")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProductRowView(product: .init(id: "1", productDisplayName: "Prueba", listPrice: 100, promoPrice: 90, lgImage: "https://via.placeholder.com/150", colorVariants: nil))
}
