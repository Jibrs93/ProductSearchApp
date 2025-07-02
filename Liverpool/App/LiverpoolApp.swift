//
//  LiverpoolApp.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

@main
struct LiverpoolApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environmentObject(ProductListAssembly.makeViewModel())
        }
    }
}
