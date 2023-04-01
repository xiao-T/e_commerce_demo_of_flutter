// edit profile
import 'dart:io';
import 'dart:async';

import 'package:e_mall_demo/models/user_info.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  double _rotateY = 2.5;

  // final File _customAvatarFile = File('assets/images/user.png');
  Future _pickAnImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);
      // setState(() {
      //   _customAvatarFile = file;
      // });
    }
  }

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      _rotateY -= 0.1;
      setState(() {
        _rotateY = _rotateY;
      });
      if (_rotateY <= 0) {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = context.watch<UserInfoModel>();
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(_rotateY),
      child: Dialog(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            padding: EdgeInsets.all(gap['l']!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Profile',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: gap['m']!,
                ),
                // Image.file(_customAvatarFile),
                GestureDetector(
                  onTap: () {
                    _pickAnImage();
                    print('tap avatar to pick new image');
                  },
                  child: Container(
                    padding: EdgeInsets.all(gap['m']!),
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: gap['m']!,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(userInfoProvider.profile['avatar']!),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  onChanged: (value) => userInfoProvider.update(
                    'username',
                    value,
                  ),
                  initialValue: userInfoProvider.profile['username'],
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Email is incorrect';
                    }
                    return null;
                  },
                  onChanged: (value) => userInfoProvider.update(
                    'email',
                    value,
                  ),
                  initialValue: userInfoProvider.profile['email'],
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: gap['m']!,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
