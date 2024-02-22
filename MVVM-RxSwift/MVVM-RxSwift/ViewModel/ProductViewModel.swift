//
//  ProductViewModel.swift
//  MVVM-RxSwift
//
//  Created by matias on 22/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

/**
 ViewModel encargado de gestionar la lógica relacionada con la presentación de productos.
 */
struct ProductViewModel {
    
    // Observable que emite un array de productos
    var items = PublishSubject<[Product]>()
    
    /**
     Recupera los productos y emite la lista a través del observable 'items'.
     
     En este ejemplo, se utilizan datos de ejemplo que representan productos con imágenes de sistema de Xcode y títulos descriptivos.
     */
    func fetchItems() {
        let products = [
            Product(imageName: "iphone", title: "iPhone"),
            Product(imageName: "ipad", title: "iPad"),
            Product(imageName: "visionpro", title: "Vision pro"),
            Product(imageName: "macbook", title: "MacBook"),
            Product(imageName: "tv", title: "Apple TV"),
            Product(imageName: "homepod", title: "HomePod"),
        ]
        
        // Emitir los productos a través del observable 'items'
        items.onNext(products)
        
        // Indicar que la secuencia de emisión ha finalizado
        items.onCompleted()
    }
}

