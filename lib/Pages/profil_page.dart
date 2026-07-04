import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("images/file_esp.png"),
            ),
            SizedBox(height: 15),
            itemProfile("Nom", "BETEL Espoir", CupertinoIcons.person),
            SizedBox(height: 15),
            itemProfile("Phone", "+235 62 75 65 09", CupertinoIcons.phone),
            SizedBox(height: 15),
            itemProfile(
              "Adress",
              "N'Dj-340 Habbena City",
              CupertinoIcons.location,
            ),
            SizedBox(height: 15),
            itemProfile(
              "Email",
              "developpeavecespoir@gmail.com",
              CupertinoIcons.mail,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  "Edit Profil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.teal.withOpacity(.2),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.white),
        tileColor: Colors.white,
      ),
    );
  }
}
