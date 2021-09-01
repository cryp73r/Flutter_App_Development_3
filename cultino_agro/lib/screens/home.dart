import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cultino_agro/screens/mandi_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cultino Agrotech Pvt. Ltd."),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.text_fields), text: "Screen 1",),
              Tab(icon: Icon(Icons.wifi), text: "Screen 2",),
            ],),
        ),
        body: const TabBarView(children: [Body(), MandiScreen()],),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _name = "";
  String _email = "";
  String _gender = "Male";
  String gender = "Male";
  String _path = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late CameraDescription camera;
  late CameraController controller;
  bool _isInited = false;
  bool _cameraEnabled = false;

  _saveDetails(String name, String email, String gender, String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("name", name);
      prefs.setString("email", email);
      prefs.setString("gender", gender);
      prefs.setString("path", path);
    });
  }

  _getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("name")??"";
      _email = prefs.getString("email")??"";
      gender = prefs.getString("gender")??"";
      _path = prefs.getString("path")??"";
    });
  }

  @override
  void initState() {
    _getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "John Doe"
              ),
              keyboardType: TextInputType.name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Can't be left Empty";
                }
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "abc@example.com",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Can't be left Empty";
                }
                else if (!value.contains('@')) {
                  return "Invalid Email";
                }
              },
            ),
            ListTile(
              leading: const Text("Gender"),
              title: Column(
                children: [
                  RadioListTile(
                      value: "Male",
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    title: const Text("Male"),
                      ),
                  RadioListTile(
                    value: "Female",
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                      },
                    title: const Text("Female"),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Image"),
                ElevatedButton(onPressed: () {
                  _cameraEnabled = true;
                  WidgetsBinding.instance?.addPostFrameCallback((_) async {
                    final cameras = await availableCameras();
                    controller = CameraController(cameras.first, ResolutionPreset.medium, enableAudio: false);
                    controller.initialize().then((value) => {
                      setState(() {
                        _isInited = true;
                      })
                    });
                  });
                },
                    child: const Text("Capture from Camera")),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    _saveDetails(nameController.text, emailController.text, _gender, _path);
                    formKey.currentState!.reset();
                    nameController.clear();
                    emailController.clear();
                    _gender = "Male";
                    _cameraEnabled = false;
                    _getDetails();
                  }
                  else {
                    debugPrint("Not Valid");
                  }
                  },
                child: const Text("Submit")),
            if (_cameraEnabled) Stack(
              children: [
                _isInited
                    ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller),
                )
                    : Container(),
                Positioned(
                  bottom: 15.0,
                  left: MediaQuery.of(context).size.width/2.3,
                  child: Center(
                      child: IconButton(onPressed: () async {
                        final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png',
                        );
                        await controller.takePicture().then((xfile) => xfile.saveTo(path));
                        _path = path;
                        setState(() {});
                      },
                      icon: const Icon(Icons.camera, color: Colors.white, size: 40.0,))),
                )
              ],
            ),
            if (_name.isNotEmpty) Card(child: ListTile(leading: CircleAvatar(radius: 30.0, child: ClipRRect(borderRadius: BorderRadius.circular(30.0),child: Image.file(File(_path), fit: BoxFit.cover,)),), title: Text(_name), subtitle: Text(_email), trailing: Text(gender.substring(0, 1)),),)
          ],
        ),
      ),
    );
  }
}

