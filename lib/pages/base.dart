import 'package:F_202030_OfflineLogin/providers/authProvider.dart';
import 'package:F_202030_OfflineLogin/providers/businessLogicProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Demo',
            home: Consumer<AuthProvider>(
              builder: (context, model, child) {
                if (model.getLogged) {
                  return BaseHomeApp();
                } else {
                  return LoginView();
                }
              },
            )));
  }
}

class BaseHomeApp extends StatelessWidget {
  const BaseHomeApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<businessLogicProvider>(
        create: (context) => businessLogicProvider(), child: HomeView());
  }
}
