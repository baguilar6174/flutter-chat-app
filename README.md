# Chat App

Esta aplicación móvil presenta la implementación de un chat creado con Flutter que implementa sockets para la comunicación directa con el servidor. Inicio y Registro de usuarios, entre otras características

## Cómo usar

Paso 1:

Tener el sdk de Flutter, este proyecto ha sido creado con Flutter en su versión `2.2.2` y Dart `2.13.3`.

Paso 2:

Clonar el repositorio del proyecto con el siguiente comando

```
git clone https://github.com/bryanAguilar001/flutter-chat-app.git
```

Paso 3:

En la raíz del proyecto ejecute el siguiente comando en la consola para obtener las dependencias necesarias:

```
flutter pub get
```

## Qué aprendí

- Diseño de pantallas de login y registro con optimizaciones y código reutilizable
- CustomInputFields
- Navegación entre pantallas
- Pull to refresh en una lista
- Mensajes de burbujas
- Animaciones de mensajes
- Consumo de servicios Rest
- Login y registro desde Flutter
- Almacenar JWT Keychain / KeyStore
- Mantener la pantalla del usuario si está autenticado

## Características

- Página de inicio de sesión (solo interfaz)
- Página de registro de usuarios (solo interfaz)
- Página de sala de chats (solo interfaz)
- Página de chat (envio de mensajes con animaciones)
- Página de precarga
- Logout


## Librerías & Paquetes usados

* `pull_to_refresh: ^2.0.0`: recarga la página con un gesto
* `provider: ^5.0.0`: manejo de estado de la aplicación
* `dio: ^4.0.0`: librería que permite hacer solicitudes http
* `flutter_secure_storage: ^4.2.0`: librería para almacenamiento seguro en el dispositivo
* `socket_io_client: ^1.0.1 `: cliente para la comunicación con sockets

# Autor

El código fuente de esta aplicación esta escrito por Bryan Aguilar (Desarrollador de Eitecknologia)

- Sitio web - [bryanaguilar](https://bryanaguilar.gatsbyjs.io/)
- GitHub - [bryanAguilar001](https://github.com/bryanAguilar001)
- LinkeIn - [bryanaguilar6174](https://www.linkedin.com/in/bryanaguilar6174)
- Email - [bryan.aguilar6174@gmail.com](mailto:bryan.aguilar6174@gmail.com)

## Band Names App

<br>
<table>
  <tr>
    <td>Login Page</td>
    <td>Register Page</td>
    <td>Users Page</td>
  </tr>
  <tr>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/login.png?raw=true" width="70%"></td>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/register.png?raw=true" width="70%"></td>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/users.png?raw=true" width="70%"></td>
  </tr>
 </table>
<br>

<br>
<table>
  <tr>
    <td>Chat Page</td>
    <td>Login Validate</td>
    <td>Logout</td>
  </tr>
  <tr>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/chat.png?raw=true" width="70%"></td>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/login_validate.png?raw=true" width="70%"></td>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/flutter-chat-app/blob/main/media/logout.png?raw=true" width="70%"></td>
  </tr>
 </table>
<br>