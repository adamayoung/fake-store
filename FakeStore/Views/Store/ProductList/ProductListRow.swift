//
//  ProductListRow.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import CachingStore
import FakeStoreDomain
import SwiftUI

struct ProductListRow: View {

    var product: Product

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

            VStack(alignment: .leading) {
                Text(verbatim: product.title)
                    .font(.headline)
                Text("\(product.price, format: .currency(code: "GBP"))")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            .padding(.leading)
        }
        .task {
            image = await imageDownloader.download(url: product.imageURL)
        }
    }

}

#Preview {
    List {
        ProductListRow(product: .mock)
    }
}
