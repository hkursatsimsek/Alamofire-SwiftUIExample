//
//  AddCategoryScreen.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 11.12.2021.
//

import SwiftUI

struct AddCategoryScreen: View {
    
    @State var categoryModel = CategoryModel()
//    var categoryRepository = CategoryRepository()
    var categoryRepository = GenericRepository<CategoryModel>()
    
    var body: some View {
        Form{
            Section(header: Text("Add Category")) {
                TextField("Name",text: $categoryModel.name)
                TextField("Description",text: $categoryModel.description)
                
                Button("Add ") {
//                    categoryRepository.addData(categoryModel: categoryModel) { res in
//                        //
//                    }
                    categoryRepository.addGeneric(url: "/categories", newModel: categoryModel) { res in
                        //
                    }
                }
            }
        }
    }
}

struct AddCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryScreen()
    }
}
