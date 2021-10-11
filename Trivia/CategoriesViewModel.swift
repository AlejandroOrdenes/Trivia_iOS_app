//
//  CategoriesViewModel.swift
//  Trivia
//
//  Created by Alejandro O. on 29-09-21.
//

import Foundation


class CategoriesViewModel {
    private var categoriesService: CategoriesService
    var categories = [Category]()
    
    
    
    
    init(service: CategoriesService) {
        self.categoriesService = service
    }
    
    
    
    func getCategoriesServ(completion: @escaping  () -> Void) { //Obtener categorias del servicio y se almacenan en el viewModel
        categoriesService.getCategoriesJSON { categories in
            self.categories = categories
            return completion()
        }
    }
    
    func getCategory(at index: Int) -> Category  { // Devuelve la categoria de la posicion Index ??????????
    categories[index]
        
    
    }
        
    func getCategoriesCount() -> Int {
        categories.count
        
    }
    

    
}
