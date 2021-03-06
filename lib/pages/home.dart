import 'package:F_202030_OfflineLogin/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Consumer<AuthProvider>(builder: (context, model, child) {
          return FlatButton(
            onPressed: () {
              model.setLogged();
            },
            child: Text('Logout'),
          );
        }),
      ),
    );
  }
}
