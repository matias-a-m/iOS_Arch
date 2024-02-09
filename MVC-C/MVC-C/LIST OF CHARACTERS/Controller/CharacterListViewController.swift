import UIKit

// MARK: - Controlador de Vista de la Lista de Personajes

/// Controlador de vista que coordina la interacción entre el modelo (datos) y la vista (UI) para la lista de personajes.
class CharacterListViewController: UIViewController {

    // Propiedad para acceder a la vista tipada como CharacterListView
    var mainView: CharacterListView { self.view as! CharacterListView }

    // Propiedad para acceder al cliente de la API que obtiene la lista de personajes
    var apiClient = ListOfCharactersAPIClient()

    // Propiedad para la fuente de datos de la tabla (patrón MVC: Modelo)
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    
    // Propiedad para el delegado de la UITableView (patrón MVC: Controlador)
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    var characterPushCoordinator: CharacterDetailPushCoordinator?
    
    var characterModalCoordinator: CharacterDetailModalCoordinator?

    // Método llamado al cargar la vista
    override func loadView() {
        // Asigna la vista tipada como CharacterListView
        view = CharacterListView()
        
        // Inicializa el delegado de la UITableView (patrón MVC: Controlador)
        tableViewDelegate = ListOfCharactersTableViewDelegate()

        // Inicializa la fuente de datos de la tabla (patrón MVC: Controlador)
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)

        // Asigna la fuente de datos y el delegado a la UITableView
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }

    // Método llamado después de que la vista ha sido cargada
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configura el bloque de acción para cuando se toque una celda
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index: \(index)")
            
            // Accede a la fuente de datos para obtener el modelo de personaje seleccionado
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            let characterModel = dataSource.characters[index]
            
//            let characterDetail = CharacterDetailPushCoordinator(characterModel: characterModel, navigationController: self?.navigationController)
             
            let characterDetail = CharacterDetailModalCoordinator(characterModel: characterModel, viewController: self)
             
            characterDetail.start()
        }
        
        // Realiza una tarea asíncrona para obtener la lista de personajes desde la API (patrón MVC: Modelo)
        Task {
            do {
                // Obtiene la lista de personajes desde la API de forma asíncrona
                let characters = try await apiClient.getListOfCharacters()

                // Imprime los personajes obtenidos desde la API
                print("Characters: \(characters)")

                // Actualiza la fuente de datos de la tabla con la nueva lista de personajes (patrón MVC: Controlador)
                tableViewDataSource?.set(characters: characters.results)
            } catch {
                // Maneja errores en la obtención de la lista de personajes
                print("Error fetching characters: \(error)")
            }
        }
    }
}
