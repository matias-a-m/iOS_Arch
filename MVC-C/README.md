# Rick and Morty Character List App

Este repositorio contiene el código fuente de una aplicación de lista de personajes de Rick and Morty para iOS. La aplicación utiliza la API pública de Rick and Morty para obtener la lista de personajes y muestra información detallada sobre cada personaje al tocar en la celda correspondiente.

## Características

- **Lista de Personajes:** Muestra una lista de personajes obtenidos de la API de Rick and Morty.
- **Detalles del Personaje:** Permite ver información detallada de un personaje al tocar en su celda.

## Requisitos

- Xcode 12.0 o superior
- Swift 5.3 o superior
- Conexión a Internet para obtener datos de la API

## Instalación

1. Clona o descarga el repositorio en tu máquina local.
2. Abre el proyecto en Xcode.
3. Ejecuta la aplicación en un simulador o dispositivo iOS.

## Estructura del Proyecto

- **CharacterListViewController:** Controlador de vista principal que coordina la interacción entre el modelo (datos) y la vista (UI) para la lista de personajes.
- **ListOfCharactersAPIClient:** Cliente de la API que obtiene la lista de personajes desde la [API de Rick and Morty](https://rickandmortyapi.com/).
- **ListOfCharactersTableViewDelegate:** Delegado de la UITableView que gestiona la selección de celdas y la altura de las mismas.
- **ListOfCharactersTableViewDataSource:** Fuente de datos para la UITableView que maneja la lógica de presentación de la lista de personajes.
- **CharacterModelResponse:** Estructura que representa la respuesta de la API que contiene la lista de personajes.
- **CharacterModel:** Estructura que representa un modelo de personaje.
- **CharacterListView:** Vista que contiene la tabla para mostrar la lista de personajes.
- **CharacterListCellView:** Celda personalizada para mostrar la información de un personaje en la lista.
- **ListOfCharactersTableViewDelegate:** Delegado de la UITableView que gestiona la selección de celdas y la altura de las mismas.
- **ListOfCharactersTableViewDataSource:** Fuente de datos para la UITableView que maneja la lógica de presentación de la lista de personajes.
- **ListOfCharactersAPIClient:** Cliente de la API que obtiene la lista de personajes desde la [API de Rick and Morty](https://rickandmortyapi.com/).
- **CharacterDetailPushCoordinator:** Coordinador para manejar la navegación a la vista de detalle de un personaje utilizando push.
- **CharacterDetailModalCoordinator:** Coordinador para manejar la presentación modal de la vista de detalle de un personaje.
- **MainCoordinator:** Coordinador principal que gestiona la navegación principal de la aplicación.

## Uso de Coordinadores

La aplicación utiliza coordinadores para gestionar la navegación entre pantallas y mejorar la modularidad del código.

### Coordinador Principal

El [MainCoordinator](MainCoordinator.swift) se encarga de gestionar la navegación principal de la aplicación. Al iniciar la aplicación, presenta la vista principal con la lista de personajes.

```swift
let navigationController = UINavigationController()
let mainCoordinator = MainCoordinator(navigationController: navigationController)
mainCoordinator.start()

