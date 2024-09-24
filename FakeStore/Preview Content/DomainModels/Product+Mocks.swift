//
//  Product+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

extension Product {

    static var mock: Self {
        Product(
            id: 3,
            title: "Men's Cotton Jacket",
            price: 55.99,
            description: "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as"
                + " working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift"
                + " choice for you or your family member. A warm hearted love to Father, husband or son in this"
                + " thanksgiving"
                + " or Christmas Day.",
            category: ProductCategory(
                id: "men's clothing",
                name: "Men's clothing",
                imageName: "tshirt.fill"
            ),
            imageURL: URL(string: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg")!,
            rating: Rating(
                rate: 4.7,
                count: 500
            )
        )
    }

    static var mocks: [Self] {
        [
            Product(
                id: 3,
                title: "Men's Cotton Jacket",
                price: 55.99,
                description: "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as"
                    + " working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good"
                    + " gift choice for you or your family member. A warm hearted love to Father, husband or son in"
                    + " this thanksgiving or Christmas Day.",
                category: ProductCategory(
                    id: "men's clothing",
                    name: "Men's clothing",
                    imageName: "tshirt.fill"
                ),
                imageURL: URL(string: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg")!,
                rating: Rating(
                    rate: 4.7,
                    count: 500
                )
            ),
            Product(
                id: 1,
                title: "Mens Casual Slim Fit",
                price: 15.99,
                description: "The color could be slightly different between on the screen and in practice. Please note"
                    + " that body builds vary by person, therefore, detailed size information should be reviewed below"
                    + " on the product description.",
                category: ProductCategory(
                    id: "men's clothing",
                    name: "Men's clothing",
                    imageName: "tshirt.fill"
                ),
                imageURL: URL(string: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg")!,
                rating: Rating(
                    rate: 2.1,
                    count: 430
                )
            )
        ]
    }
}
