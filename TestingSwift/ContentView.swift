//
//  ContentView.swift
//  TestingSwift
//
//  Created by ZinThant on 5/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack(content: {
            GeometryReader(content: { geometry in
                AsyncImage(url: URL(string: "https://fifpro.org/media/fhmfhvkx/messi-world-cup.jpg?rxy=0.48356841796117644,0.31512414378031967&width=1600&height=1024&rnd=133210253587130000"))
                    .frame(width: geometry.size.width,height: geometry.size.height)
            })
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
