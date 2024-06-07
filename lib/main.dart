import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_j_safe_guard/screen/lc.dart';
import 'package:tes_j_safe_guard/screen/splash/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'provider/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBw_4sOdRmmECfXgU2iK13Y9_zXpOTx9pc',
      appId: '1:528361676273:android:bf27e77a793bba68e67850',
      messagingSenderId: '528361676273',
      projectId: 'jsafeguard-8eb27',
    ),
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        title: 'Jember - Safe Guard',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
