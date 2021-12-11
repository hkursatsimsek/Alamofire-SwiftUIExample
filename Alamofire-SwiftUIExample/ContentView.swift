//
//  ContentView.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 11.12.2021.
//

import SwiftUI
import Alamofire


struct ContentView: View {
    var categoryRepository = CategoryRepository()
    @State var categoryList = [CategoryModel]()
    
    var body: some View {
        VStack{
            List(categoryList, id:\.name) { item in
                Text(item.name)
            }
            
        }.onAppear() {
            categoryRepository.getAll { categories in
                categoryList = categories
                print(categoryList)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

