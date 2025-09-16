📦 Cartify

Store app (Flutter)

A simple shopping app named Cartify that fetches products from a REST API, supports searching, adding/removing products from the cart, creating and editing orders, and uses a combination of remote and local storage (API + Firebase + SharedPreferences + SQLite).

🔍 Features

Fetch products from a remote REST API

Search products (client-side and server-side ready)

Add / remove products from the cart

Create and edit orders (send to API)

Persist user/session data with SharedPreferences

Persist cart/order local cache with SQLite

Notifications (via Firebase Cloud Messaging)

Offline-friendly: show cached data when network unavailable

🧰 Tech stack

Flutter (Dart)

State management: Cubit / Bloc

Networking: http or dio

Local storage: shared_preferences, sqflite

Remote store: REST API