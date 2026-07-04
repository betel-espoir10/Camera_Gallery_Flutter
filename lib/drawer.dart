import 'package:camera_gallery/main.dart';
import 'package:flutter/material.dart';

class DrawerHeaderMain extends StatelessWidget {
  const DrawerHeaderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.tealAccent, Colors.lightBlue],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/file_esp.png"),
                radius: 60,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/home");
            },
          ),
          Divider(color: Theme.of(context).primaryColor),
          ListTile(
            title: Text(
              "Profil",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profil");
            },
          ),
          Divider(color: Theme.of(context).primaryColor),
          ListTile(
            title: Text(
              "Message",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.message),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/message");
            },
          ),
          Divider(color: Theme.of(context).primaryColor),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
    );
  }
}
