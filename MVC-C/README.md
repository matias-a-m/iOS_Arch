# Coordinator Pattern Example

Este es un ejemplo sencillo que ilustra el uso del patrón de coordinador en una aplicación iOS. El patrón de coordinador se utiliza para gestionar la navegación entre diferentes pantallas de la aplicación.

## Contenido

- [Concepto Básico](#concepto-básico)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Uso del Coordinador](#uso-del-coordinador)

## Concepto Básico

El patrón de coordinador se basa en la idea de tener un objeto central llamado "coordinador" que se encarga de gestionar la navegación y la transición entre diferentes controladores de vista en la aplicación. El objetivo principal es desacoplar la navegación del código de los controladores de vista, lo que facilita la reutilización y la prueba del código.

## Estructura del Proyecto

La aplicación de ejemplo tiene la siguiente estructura de archivos:

- **MainCoordinator.swift:** El coordinador principal que gestiona la navegación principal de la aplicación.
- **FirstViewController.swift:** El primer controlador de vista que contiene un botón para navegar a la segunda vista.
- **SecondViewController.swift:** El segundo controlador de vista al que se navega desde el primer controlador.

## Uso del Coordinador

```swift
// Coordinator Protocol
protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}

// First Coordinator
class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        navigationController?.pushViewController(firstViewController, animated: true)
    }

    func navigateToSecondView() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        secondCoordinator.start()
    }
}

// Second Coordinator
class SecondCoordinator: Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

// First View Controller
class FirstViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setTitle("Go to Second View", for: .normal)
        button.addTarget(self, action: #selector(goToSecondView), for: .touchUpInside)

        view.addSubview(button)
    }

    @objc func goToSecondView() {
        coordinator?.navigateToSecondView()
    }
}

// Second View Controller
class SecondViewController: UIViewController {
    weak var coordinator: SecondCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}
