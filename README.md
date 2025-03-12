
---
<a> Una calculadora científica implementada en Flutter. Incluye operaciones básicas y funciones científicas.<a>

<p align="center">
  <img src="Screenshot 2025-03-11 at 19-01-44 Calculadora.png" alt="Captura de pantalla" width="120">
</p>

---

```markdown
# Calculadora Científica Retro en Flutter

## Características ✨
- **Operaciones básicas**: `+`, `-`, `*`, `/`.
- **Funciones científicas**: `sin`, `cos`, `tan`, `log`, `√`.
- **Diseño retro**: Fuente pixelada, colores vibrantes y botones 3D.
- **Manejo de errores**: Detecta divisiones por cero y operaciones inválidas.
- **Variables en español**: Código fácil de entender para hispanohablantes.

## Instalación ⚙️

### Requisitos
- Flutter SDK (versión 3.13.9 o superior)
- Dart (versión 3.1.0 o superior)

### Pasos
1. Clona el repositorio:
   ```bash
   git clone https://github.com/Migueh02/flutter-calculator.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd flutter-calculator
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la app:
   ```bash
   flutter run
   ```

## Uso 🧮
- **Interfaz**:
  - **Pantalla**: Muestra números y resultados en naranja sobre fondo oscuro.
  - **Botones**:
    - **Números**: `0-9`
    - **Operaciones básicas**: `+`, `-`, `*`, `/`, `=`
    - **Científicas**: `sin`, `cos`, `tan`, `log`, `√`
    - **Borrar**: `C`

- **Ejemplos**:
  - `5 + 3 =` → `8`
  - `sin(30)` → `0.5`
  - `√25` → `5`
  - `10 / 0` → `Error`

## Tecnologías 🛠️
- **Flutter**: Framework para aplicaciones multiplataforma.
- **Dart**: Lenguaje de programación.
- **Google Fonts**: Fuente `Tiny5` para el estilo retro.
- **Aproximaciones matemáticas**: Series de Taylor y método de Newton-Raphson.

## Licencia 📄
Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

## Contribuciones 🤝
¡Las contribuciones son bienvenidas! Abre un **issue** para reportar errores o un **pull request** para proponer mejoras.

---

**Nota**: Los cálculos científicos son aproximaciones y pueden tener pequeñas diferencias con calculadoras profesionales.
```

---

### Pasos adicionales:
1. Crea un archivo `LICENSE` con el texto de la licencia MIT.
2. Agrega una captura de pantalla (`screenshot.png`) de tu calculadora.
3. Personaliza los enlaces de tu usuario de GitHub en el código.

### Estructura recomendada del repositorio:
```
    flutter-calculator/
    ├── lib/
    │   └── main.dart
    ├── assets/
    │   └── screenshot.png
    ├── README.md
    ├── LICENSE
    └── pubspec.yaml
```
