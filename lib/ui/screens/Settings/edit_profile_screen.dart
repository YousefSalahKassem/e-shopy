import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/providers/edit_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/themes/dimensions.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.editProfile.tr(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
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
                const _UserForm(),
                SizedBox(height: context.heightR(0.1)),
                DefaultButton(
                  text: LocaleKeys.updateProfile.tr(),
                  press: () {
                    FocusScope.of(context).unfocus();
                    ref.read(EditProvider.provider.notifier).changeName()
                        .whenComplete(() => AutoRouter.of(context).replace(const LandingRoute()));
                  },
                ),
                SizedBox(height: context.heightR(0.05)),
              ],
            ),
        ),
    );
  }
}

class _UserForm extends ConsumerWidget {
  const _UserForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.watch(RemoteUtil.provider);
    return Form(
      key: reader.updateUserKey,
      child: Column(
        children: [
          TextFieldApp(
            label: LocaleKeys.username.tr(),
            hint: LocaleKeys.enterUsername.tr(),
            controller: reader.nameController,
            icon: Icons.person,
            type: TextInputType.text,
            valid: LocaleKeys.nameRequired.tr(),
          ),
        ],
      ),
    );
  }
}
