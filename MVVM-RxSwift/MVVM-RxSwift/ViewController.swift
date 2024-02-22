//
//  ViewController.swift
//  MVVM-RxSwift
//
//  Created by matias on 22/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

/**
 Controlador de vista que muestra una lista de productos utilizando RxSwift y RxCocoa.
 
 Este controlador utiliza un ViewModel para gestionar la lógica de presentación y la interacción con la tabla.
 */
class ViewController: UIViewController {
    
    /// La tabla que muestra la lista de productos.
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    /// DisposeBag para gestionar la liberación de recursos de RxSwift.
    private var disposeBag = DisposeBag()
    
    /**
     Método llamado después de cargar la vista. Configura la apariencia y enlaza los datos a la tabla.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindTableData()
    }

    /**
     Configura la apariencia y el diseño de la tabla.
     
     Esta función agrega la tabla como una subvista de la vista principal y establece su tamaño para ocupar toda la pantalla.
     */
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    /**
     Enlaza los datos del ViewModel a la tabla y maneja las interacciones del usuario.
     
     Este método crea una instancia del ViewModel, enlaza los datos a las celdas de la tabla y maneja las selecciones de celda.
     */
    private func bindTableData() {
        // Crear una instancia del ViewModel
        let viewModel = ProductViewModel()
        
        // Enlazar los datos del ViewModel a las celdas de la tabla
        viewModel.items
            .bind(
                to: tableView.rx.items(
                    cellIdentifier: "cell",
                    cellType: UITableViewCell.self)
            ) { row, model, cell in
                cell.textLabel?.text = model.title
                cell.imageView?.image = UIImage(systemName: model.imageName)
            }
            .disposed(by: disposeBag)
        
        // Manejar la selección de una celda e imprimir el título del producto
        tableView.rx.modelSelected(Product.self)
            .bind { product in
                print(product.title)
            }
            .disposed(by: disposeBag)
        
        // Iniciar la obtención de datos llamando al método fetchItems del ViewModel
        viewModel.fetchItems()
    }
}
