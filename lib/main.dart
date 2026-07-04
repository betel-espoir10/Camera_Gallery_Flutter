import 'dart:io';
import 'package:camera_gallery/Pages/message_page.dart';
import 'package:camera_gallery/Pages/profil_page.dart';
import 'package:camera_gallery/Pages/settings_page.dart';
import 'package:camera_gallery/drawer.dart';
import 'package:camera_gallery/screens/login_page.dart';
import 'package:camera_gallery/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      routes: {
        "/home": (context) => CameraGalleryPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/profil": (context) => ProfilPage(),
        "/settings": (context) => SettingsPage(),
        "/message": (context) => MessagePage(),
      },
      title: "Camera",
      home: LoginPage(),
    ),
  );
}

class CameraGalleryPage extends StatefulWidget {
  const CameraGalleryPage({super.key});

  @override
  State<CameraGalleryPage> createState() => _CameraGalleryPageState();
}

class _CameraGalleryPageState extends State<CameraGalleryPage> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _openGallery(BuildContext context) async {
    final XFile? picture = await _picker.pickImage(source: ImageSource.gallery);
    if (picture != null) {
      setState(() {
        imageFile = File(picture.path);
      });
    }
  }

  Future<void> _openCamera(BuildContext context) async {
    final XFile? picture = await _picker.pickImage(source: ImageSource.camera);
    if (picture != null) {
      setState(() {
        imageFile = File(picture.path);
      });
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Make a choice"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    _openGallery(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHeaderMain(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            "CameraApp",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/login");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageFile == null
                  ? const Text(
                      "No Image Selected !",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    )
                  : Image.file(imageFile!, height: 300),
              TextButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text("Select Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
