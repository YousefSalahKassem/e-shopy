import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/edit_provider.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

import '../../../themes/dimensions.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFFFFECDF),
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.grey.shade400,
                    size: 50,
                  ),
                ),
                SizedBox(height: context.heightR(0.05)),
                _userForm(context, ref),
                SizedBox(height: context.heightR(0.1)),
                DefaultButton(
                  text: 'Update Profile',
                  press: () {
                    ref.read(EditProvider.provider.notifier).changeName(context);
                  },
                ),
                SizedBox(height: context.heightR(0.05)),
              ],
            ),
        )
    );
  }
}

Widget _userForm(BuildContext context, WidgetRef ref) {
  final reader = ref.watch(RemoteUtil.provider);
  return Form(
      key: reader.updateUserKey,
      child: Column(
        children: [
          TextFieldApp(
            label: 'userName',
            hint: 'Enter your userName',
            controller: reader.nameController,
            icon: Icons.person,
            type: TextInputType.text,
            valid: 'UserName is Required',
          ),
        ],
      ),
  );
}
