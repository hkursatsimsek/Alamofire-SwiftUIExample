//
//  SupplierListScreen.swift
//  Alamofire-SwiftUIExample
//
//  Created by Kürşat Şimşek on 17.12.2021.
//

import SwiftUI

struct SupplierListScreen: View {
//    var supplierRepository = SupplierRepository()
    var supplierRepository = GenericRepository<SupplierModel>()
    @State var supplierList = [SupplierModel]()
    
    var body: some View {
        VStack{
            List(supplierList, id:\.companyName) { item in
                Text(item.companyName)
            }
            
        }.onAppear() {
//            supplierRepository.getAll { suppliers in
//                supplierList = suppliers
//                print(supplierList)
//            }
            supplierRepository.getAllGeneric(url: "/suppliers") { suppliers in
                supplierList = suppliers
            }
        }
    }
}

struct SupplierListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SupplierListScreen()
    }
}
