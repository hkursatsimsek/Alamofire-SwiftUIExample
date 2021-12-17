//
//  GenericRepository.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 18.12.2021.
//

import Foundation
import Alamofire

struct GenericRepository<T> where T : Codable { // Bu struct dısarıdan bir T alacak ancak bu her zaman Decodable(Codable hepsini kapsar) olmak zorunda diye şart belirtiyoruz. Referencing instance method 'responseDecodable(of:queue:dataPreprocessor:decoder:emptyResponseCodes:emptyRequestMethods:completionHandler:)' on 'Array' requires that 'T' conform to 'Decodable' Hatasının çözümü
    
    var baseURL = "https://northwind.vercel.app/api"
    
    func getAllGeneric(url: String,completionHandler: @escaping(([T])->Void)) {
        let request = AF.request(baseURL + url)
        
        request.responseDecodable(of: [T].self) { response in
            completionHandler(response.value!)
        }
    }
    
    func deleteGeneric(url: String, id: Int) {
        AF.request("\(url)\(id)", method: .delete).responseData { response in
            //
        }
    }
    
    func addGeneric(url:String, newModel: T, completionHandler: @escaping (T) -> Void) {
//        Cannot convert value of type 'T' to expected argument type 'Parameters?' (aka 'Optional<Dictionary<String, Any>>') hatası çözümü için encoding: JSONEncoding.default yerine encoder:JSONParameterEncoder.default ayrıca Decodable' i Codable' a çevirdik
        AF.request(baseURL + url ,method: .post, parameters: newModel, encoder:JSONParameterEncoder.default).responseDecodable(of: T.self) { response in
            completionHandler(response.value!)
        }
    }
}

//
//func getAll(completionHandler: @escaping ([CategoryModel]) -> Void) {
//    let request = AF.request("https://northwind.vercel.app/api/categories")
//
//    request.responseDecodable(of: [CategoryModel].self) { response in
//        completionHandler(response.value!)
//    }
//}



//func addData(categoryModel: CategoryModel, completionHandler: @escaping (CategoryModel) -> Void) {
//    let newCategory : [String:Any] = [
//        "name" : categoryModel.name,
//        "description" : categoryModel.description
//    ]
//
////        AF.request("https://northwind.vercel.app/api/categories",method: .post, parameters: newCategory, encoding: JSONEncoding.default).responseJSON { response in
////                print(response)
////        }
//
//    // Data eklendikten sonra datayı completion handler ile iletiyorum.
//    AF.request("https://northwind.vercel.app/api/categories",method: .post, parameters: newCategory, encoding: JSONEncoding.default).responseDecodable(of: CategoryModel.self) { response in
//        completionHandler(response.value!)
//    }
//}
//
//func deleteCategory(id: Int) {
//    AF.request("https://northwind.vercel.app/api/categories/\(id)",method: .delete).responseData { response in
//        print(response)
//    }
//}
