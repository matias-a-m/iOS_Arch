# Aplicación de Lista de Personajes de Rick and Morty en iOS - Patrón MVC

Esta aplicación iOS implementa una lista de personajes de Rick and Morty siguiendo el patrón de diseño MVC (Model-View-Controller). El MVC se utiliza para organizar y separar las responsabilidades del modelo, la vista y el controlador, proporcionando una estructura modular y fácil de mantener.

## Características

- **Lista de Personajes:** Muestra una lista de personajes obtenidos de la [API de Rick and Morty](https://rickandmortyapi.com/).

- **Detalles del Personaje:** Permite ver detalles específicos de un personaje, incluyendo su imagen, nombre, estado y especie.

## Estructura del Proyecto

### Modelo (Model)

- **CharacterModel.swift:** Estructura que representa un modelo de personaje. Contiene propiedades como nombre, estado, especie e imagen.

- **CharacterModelResponse.swift:** Estructura que representa la respuesta de la API que contiene la lista de personajes.

### Vista (View)

- **CharacterListView.swift:** Vista que contiene la tabla para mostrar la lista de personajes.

- **CharacterListCellView.swift:** Celda personalizada para mostrar la información de un personaje en la lista.

- **DetailView.swift:** Vista de detalle para un personaje.

### Controlador (Controller)

- **CharacterListViewController.swift:** Controlador de vista que gestiona la lista de personajes. Utiliza una `UITableView` para mostrar los personajes y se comunica con la API para obtener los datos.

- **ListOfCharactersTableViewDelegate.swift:** Delegado de la `UITableView` que maneja las interacciones del usuario, como tocar en una celda.

- **ListOfCharactersTableViewDataSource.swift:** Fuente de datos de la `UITableView` que proporciona los datos de los personajes y gestiona la descarga de imágenes de forma asíncrona.

- **CharacterDetailViewController.swift:** Controlador de vista para los detalles de un personaje.

- **ListOfCharactersAPIClient.swift:** Cliente de la API que realiza solicitudes para obtener la lista de personajes.

## Configuración del Proyecto

1. **Clonar el Repositorio:** Clona este repositorio en tu entorno de desarrollo local.

2. **Requisitos:** Asegúrate de tener un entorno de desarrollo compatible con Swift y Xcode.

3. **Ejecutar la Aplicación:** Abre el archivo `CharacterList.xcodeproj` en Xcode y ejecuta la aplicación en el simulador o un dispositivo iOS.

## Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras errores, mejoras o nuevas características que podrían añadirse, no dudes en abrir un *issue* o enviar una *pull request*.

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
