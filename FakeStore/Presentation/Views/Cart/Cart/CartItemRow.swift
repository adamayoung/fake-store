//
//  CartItemRow.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CartItemRow: View {

    var item: Cart.Item

    @State private var image: UIImage?

    @Environment(\.imageDownloader)
    private var imageDownloader

    var body: some View {
        HStack {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .cornerRadius(10)
                .clipped()
                .id(image)
                .transition(.blurReplace.animation(.easeOut))

            VStack(alignment: .leading, spacing: 10) {
                Text(verbatim: item.title)
                    .font(.headline)
                Text("QUANTITY_\(item.quantity)")
                Text("\(item.price, format: .currency(code: "GBP"))")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            .padding(.leading)
        }
        .task {
            image = await imageDownloader.download(url: item.imageURL)
        }
    }

}

#Preview("Single Item") {
    List {
        CartItemRow(
            item: Cart.Item.mock()
        )
    }
}

#Preview("Multiple Single Items") {
    List {
        CartItemRow(
            item: Cart.Item.mock(quantity: 5)
        )
    }
}
