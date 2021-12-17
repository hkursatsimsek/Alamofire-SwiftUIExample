//
//  CategoryListScreen.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 17.12.2021.
//

import SwiftUI
import Alamofire

struct CategoryListScreen: View {
//    var categoryRepository = CategoryRepository()
    var categoryRepository = GenericRepository<CategoryModel>()
    
    @State var categoryList = [CategoryModel]()
    
    var body: some View {
        VStack{
            List(categoryList, id:\.name) { item in
                Text(item.name)
            }
            
        }.onAppear() {
//            categoryRepository.getAll { categories in
//                categoryList = categories
//                print(categoryList)
//            }
            categoryRepository.getAllGeneric(url: "/categories") { categories in
                categoryList = categories
            }
        }
            
    }
}

