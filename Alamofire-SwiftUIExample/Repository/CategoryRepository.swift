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

}
