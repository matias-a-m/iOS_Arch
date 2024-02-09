import UIKit

// Clase que representa el controlador de vista para los detalles de un personaje.
class CharacterDetailViewController: UIViewController {
    // Propiedad para acceder a la vista tipada como DetailView
    var mainView: DetailView { self.view as! DetailView }
    
    // Inicializador personalizado que recibe un modelo de detalle de personaje.
    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        
        // Configura la vista con los datos del modelo al inicializar.
        mainView.configure(characterDetailModel)
    }
    
    // Inicializador requerido al implementar la inicialización desde un archivo de codificación (archivos xib, storyboards, etc.).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método llamado al cargar la vista
    override func loadView() {
        // Asigna la vista tipada como DetailView
        view = DetailView()
    }
    
    // Método llamado después de que la vista ha sido cargada
    override func viewDidLoad() {
        super.viewDidLoad()
        // Puedes realizar acciones adicionales después de que la vista se haya cargado completamente.
    }
}
