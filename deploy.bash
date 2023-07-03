flutterflow export-code --project empowerment-circle-oi0986 --dest . --token c65afde8-8f4c-4f7a-a5bb-e0b671945512

firebase init hosting
flutter build web --web-renderer html
firebase deploy --only hosting