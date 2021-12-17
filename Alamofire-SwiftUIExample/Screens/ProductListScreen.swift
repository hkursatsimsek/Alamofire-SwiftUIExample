//
//  ProductListScreen.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import SwiftUI

struct ProductListScreen: View {
    
    var productRepository = GenericRepository<ProductModel>()
    @State var products = [ProductModel]()
    
    var body: some View {
        VStack{
            List(products, id:\.name){ item in
                Text(item.name)
            }.onAppear() {
                productRepository.getAllGeneric(url: "/products") { data in
                    products = data
                }
            }
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
