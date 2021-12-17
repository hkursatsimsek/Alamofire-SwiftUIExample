//
//  SupplierRepository.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 17.12.2021.
//

import Foundation
import Alamofire

class SupplierRepository {
    func getAll(completionHandler: @escaping ([SupplierModel]) -> Void) {
        let request = AF.request("https://northwind.vercel.app/api/suppliers")
        
        request.responseDecodable(of: [SupplierModel].self) { response in
            completionHandler(response.value!)
        }
    }
}
