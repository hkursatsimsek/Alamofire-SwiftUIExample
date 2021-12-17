//
//  CategoryRepository.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 11.12.2021.
//

import Foundation
import Alamofire

class CategoryRepository {
    func getData() {
        let request = AF.request("https://northwind.vercel.app/api/categories")
        
        request.responseJSON { data in
            print(data)
        }
    }

    func getAll(completionHandler: @escaping ([CategoryModel]) -> Void) {
        let request = AF.request("https://northwind.vercel.app/api/categories")
        
        request.responseDecodable(of: [CategoryModel].self) { response in
            completionHandler(response.value!)
        }
    }
    
    func addData(categoryModel: CategoryModel, completionHandler: @escaping (CategoryModel) -> Void) {
        let newCategory : [String:Any] = [
            "name" : categoryModel.name,
            "description" : categoryModel.description
        ]

//        AF.request("https://northwind.vercel.app/api/categories",method: .post, parameters: newCategory, encoding: JSONEncoding.default).responseJSON { response in
//                print(response)
//        }
        
        // Data eklendikten sonra datayı completion handler ile iletiyorum.
        AF.request("https://northwind.vercel.app/api/categories",method: .post, parameters: newCategory, encoding: JSONEncoding.default).responseDecodable(of: CategoryModel.self) { response in
            completionHandler(response.value!)
        }
    }
    
    func deleteCategory(id: Int) {
        AF.request("https://northwind.vercel.app/api/categories/\(id)",method: .delete).responseData { response in
            print(response)
        }
    }

}
