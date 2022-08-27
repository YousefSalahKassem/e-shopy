import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';
import 'package:flutter_boilerplate/blocs/providers/add_address_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/helpers/remote_util.dart';
import 'package:flutter_boilerplate/services/local/address_provider.dart';
import 'package:flutter_boilerplate/themes/flavor/light/colors.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_boilerplate/ui/widgets/default_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class AddAddressScreen extends ConsumerWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.addAddress.tr(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
        ),
        backgroundColor: const Color(0xFFFFECDF),
        centerTitle: true,
      ),
      body: _buildInformation(context, ref),
    );
  }
}

Widget _buildInformation(BuildContext context, WidgetRef ref) {
  final addAddress = ref.watch(AddAddressProvider.provider.notifier);
  final notifier = ref.watch(RemoteUtil.provider);
  final getAddress = ref.watch(AddressProvider.provider);
  return SingleChildScrollView(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.heightR(.3),
            width: context.heightR(1),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: getAddress.kGooglePlex,
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(getAddress.markers),
                  onMapCreated: (GoogleMapController addressController) {
                    getAddress.addressController.complete(
                      addressController,
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: FloatingActionButton(
                    backgroundColor: kPrimaryColor,
                    onPressed: () {
                      getAddress.getUserCurrentLocation();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: context.heightR(.04),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: context.heightR(.03),
          ),
          Form(
            key: notifier.addressKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.heightR(.03),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldApp(
                    label: LocaleKeys.country.tr(),
                    hint: LocaleKeys.enterCountry.tr(),
                    valid: LocaleKeys.countryRequired.tr(),
                    controller: notifier.countryController,
                    icon: Icons.location_on,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: context.heightR(.02),
                  ),
                  TextFieldApp(
                    label: LocaleKeys.city.tr(),
                    hint: LocaleKeys.enterCity.tr(),
                    valid: LocaleKeys.cityRequired.tr(),
                    controller: notifier.cityController,
                    icon: Icons.location_city,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: context.heightR(.02),
                  ),
                  TextFieldApp(
                    label: LocaleKeys.street.tr(),
                    hint: LocaleKeys.enterStreet.tr(),
                    valid: LocaleKeys.streetRequired.tr(),
                    controller: notifier.streetController,
                    icon: Icons.location_searching,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: context.heightR(.02),
                  ),
                  TextFieldApp(
                    label: LocaleKeys.postalCode.tr(),
                    hint: LocaleKeys.enterPostalCode.tr(),
                    valid: LocaleKeys.postalCodeRequired.tr(),
                    controller: notifier.postalCodeController,
                    icon: Icons.location_searching,
                    type: TextInputType.number,
                  ),
                  SizedBox(
                    height: context.heightR(.02),
                  ),
                  DefaultButton(
                    text: LocaleKeys.save.tr(),
                    press: () {
                      if (notifier.addressKey.currentState!.validate()) {
                        addAddress.insert(
                          AddressModel(
                            country: notifier.countryController.text,
                            city: notifier.cityController.text,
                            street: notifier.streetController.text,
                            postcode: notifier.postalCodeController.text,
                          ),
                        );
                        AutoRouter.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
