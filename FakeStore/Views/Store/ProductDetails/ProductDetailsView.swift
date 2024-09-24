//
//  ProductDetailsView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import CachingStore
import FakeStoreDomain
import SwiftUI

struct ProductDetailsView: View {

    @State private var viewModel: ProductDetailsViewModel
    @State private var image: UIImage?

    @Environment(Cart.self)
    private var cart: Cart

    @Environment(\.imageDownloader)
    private var imageDownloader

    init(viewModel: ProductDetailsViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List {
            Section {
                mainSection
            }

            Section {
                addToCartRow
            }
            .listRowBackground(Color.clear)

            Section("DESCRIPTION") {
                Text(verbatim: viewModel.product.description)
            }

            Section("RATING") {
                LabeledContent("SCORE") {
                    Text("\(viewModel.product.rating.rate, format: .number)")
                }
            }
        }
        .task {
            await viewModel.fetchData()
            image = await imageDownloader.download(url: viewModel.product.imageURL)
        }
        .navigationTitle("PRODUCT_DETAILS")
    }

    @ViewBuilder private var mainSection: some View {
        Text(verbatim: viewModel.product.title)
            .font(.headline)

        HStack {
            Spacer()
            Image(uiImage: image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .background(Color.white)
                .cornerRadius(10)
                .clipped()
                .id(image)
                .transition(.blurReplace.animation(.easeOut))
            Spacer()
        }

        LabeledContent("CATEGORY") {
            Text(verbatim: viewModel.product.category.name)
        }

        LabeledContent("PRICE") {
            Text("\(viewModel.product.price, format: .currency(code: "GBP"))")
                .font(.headline)
        }
    }

    @ViewBuilder private var addToCartRow: some View {
        Button("ADD_TO_CART") {
            addToCart()
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
    }

    private func addToCart() {
        #if os(iOS)
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        #endif
        cart.add(viewModel.product)
    }

}

#Preview {
    @Previewable @State var cart = Cart()

    NavigationStack {
        ProductDetailsView(
            viewModel: ProductDetailsViewModel(
                product: Product.mock,
                dependencies: .mock
            )
        )
    }
    .environment(cart)
}
