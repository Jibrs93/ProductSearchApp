//
//  View+Placeholders
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

// View+Placeholders.swift

import SwiftUI

extension View {
    
    /// Aplica un efecto de carga (placeholder estilo skeleton)
    func loadingPlaceholder(_ isLoading: Bool) -> some View {
        self
            .redacted(reason: isLoading ? .placeholder : [])
            .animation(.easeInOut(duration: 0.3), value: isLoading)
    }
    
    /// Muestra una vista de estado vacío con ícono y mensaje
    func emptyState(_ isEmpty: Bool, message: String = "No hay resultados") -> some View {
        ZStack {
            self
            if isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "tray")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                    Text(message)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding()
            }
        }
    }
    
    /// Muestra un overlay de loader encima del contenido
    func loadingOverlay(_ isLoading: Bool) -> some View {
        ZStack {
            self
            if isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}
