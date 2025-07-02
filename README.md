# Liverpool Product Search App

Una aplicación de prueba técnica para desarrolladores iOS, construida en **SwiftUI**, utilizando **arquitectura MVVM + Clean Architecture** y principios **SOLID**. Esta app permite buscar productos de Liverpool, ver precios (con y sin descuento), colores disponibles y ordenarlos.

---

## 🔧 Tecnologías Utilizadas

* Swift 5.9
* SwiftUI (iOS 16.4)
* MVVM + Clean Architecture
* Unit Testing con XCTest

---

## 🔄 Funcionalidades

* [x] Búsqueda de productos por nombre
* [x] Vista de lista con imagen, nombre, precio y colores
* [x] Precios con y sin descuento
* [x] Ordenamiento por:

  * Relevancia
  * Más barato / caro
  * Más nuevo / mejor calificado
* [x] Scroll infinito (paginación)
* [x] Loader inicial y skeleton loading
* [x] Pruebas unitarias para el ViewModel

---

## 🌐 API utilizada

La app consume datos desde el servicio oficial de Liverpool:

**Endpoint base:**

```
https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf
```

**Parámetros clave:**

* `page-number=1`: número de página (soporta paginación)
* `search-string=zapato`: término de búsqueda
* `number-of-items-per-page=40`: cantidad de productos por página
* `sort-option=highestPrice`: criterio de ordenamiento

**Ejemplos de búsqueda:**

* Sin ordenamiento:
  [https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=1\&search-string=zapato\&force-plp=false\&number-of-items-per-page=40\&cleanProductName=false](https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=1&search-string=zapato&force-plp=false&number-of-items-per-page=40&cleanProductName=false)

* Con ordenamiento (mayor precio):
  [https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=1\&search-string=zapato\&force-plp=false\&number-of-items-per-page=40\&cleanProductName=false\&sort-option=highestPrice](https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=1&search-string=zapato&force-plp=false&number-of-items-per-page=40&cleanProductName=false&sort-option=highestPrice)

* Otros valores para `sort-option`:

  * `relevance`
  * `lowestPrice`
  * `highestPrice`
  * `newest`
  * `ratings`

---

## 📂 Estructura del Proyecto

```
Liverpool/
├── App/
│   └── LiverpoolApp.swift
├── Core/
│   ├── Networking/
│   │   └── APIClient.swift
│   ├── Extensions/
│   │   └── Color+Hex.swift
│   │   └── View+Placeholders.swift
│   └── UIComponents/
│       └── SearchBarView.swift
│       └── AsyncImageView.swift
├── Features/
│   └── ProductList/
│       ├── Data/
│       │   ├── API/ProductAPIService.swift
│       │   ├── Models/ProductResponseDTO.swift
│       │   └── Repositories/ProductRepository.swift
│       ├── Domain/
│       │   ├── Entities/Product.swift
│       │   ├── UseCases/FetchProductsUseCase.swift
│       │   └── Repositories/ProductRepositoryProtocol.swift
│       ├── Presentation/
│       │   ├── ViewModels/ProductListViewModel.swift
│       │   └── Views/ProductListView.swift, ProductRowView.swift
│       └── DI/ProductListAssembly.swift
├── Resources/
│   ├── Assets.xcassets
│   └── LaunchScreen.storyboard
└── Tests/
    └── ProductListViewModelTests.swift
```
---

## 📊 Pruebas Unitarias

* Ubicadas en `Tests/ProductListViewModelTests.swift`

![Captura de pantalla 2025-07-02 a la(s) 1 34 47 p m](https://github.com/user-attachments/assets/6aecec81-fbf4-498a-8dc6-d26ba3bba318)

---

## 📃 Notas adicionales

* Puedes cambiar el término de búsqueda inicial desde el `ProductListViewModel`

---

## 🚀 Autor

**Jonathan López**

> iOS Developer | Swift | SwiftUI | Clean Architecture

---

## 🌐 Demo / Capturas

![Simulator Screenshot - iPhone 16 Pro - 2025-07-02 at 14 46 39](https://github.com/user-attachments/assets/5dddb9c4-240f-417f-b0a8-aa4c7a9d77f7)


---

🚀 Proyecto hecho con fines educativos / evaluación técnica.
