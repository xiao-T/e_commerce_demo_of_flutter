// edit profile

import 'package:e_mall_demo/models/user_info.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditForm extends StatelessWidget {
  const EditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = context.watch<UserInfoModel>();
    return Dialog(
      child: Form(
        child: Container(
          padding: EdgeInsets.all(gap['l']!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextFormField(
                onChanged: (value) => userInfoProvider.update(
                  'username',
                  value,
                ),
                initialValue: userInfoProvider.username,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Username',
                ),
              ),
              TextFormField(
                onChanged: (value) => userInfoProvider.update(
                  'email',
                  value,
                ),
                initialValue: userInfoProvider.email,
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
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
