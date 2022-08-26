import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';
import 'package:flutter_boilerplate/blocs/providers/add_address_provider.dart';
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
          title: const Text('Add Address', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFFFFECDF),
          centerTitle: true,
        ),
        body: _buildInformation(context,ref),
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
                        addressController,);
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
                        child: Icon(Icons.add,
                            color: Colors.white, size: context.heightR(.3),),
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: context.heightR(.03),),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: context.heightR(.03),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldApp(
                        label: 'country',
                        hint: 'country',
                        valid: 'country field is required',
                        controller: notifier.countryController,
                        icon: Icons.location_on,
                        type: TextInputType.text,),
                    SizedBox(height: context.heightR(.02),),
                    TextFieldApp(
                        label: 'city',
                        hint: 'city',
                        valid: 'city field is required',
                        controller: notifier.cityController,
                        icon: Icons.location_city,
                        type: TextInputType.text,
                    ),
                    SizedBox(height: context.heightR(.02),),
                    TextFieldApp(
                        label: 'street',
                        hint: 'street',
                        valid: 'street field is required',
                        controller: notifier.streetController,
                        icon: Icons.location_searching,
                        type: TextInputType.text,),
                    SizedBox(height: context.heightR(.02),),
                    TextFieldApp(
                        label: 'PostalCode',
                        hint: 'postal code',
                        valid: 'postal code field is required',
                        controller: notifier.postalCodeController,
                        icon: Icons.location_searching,
                        type: TextInputType.number,),
                    SizedBox(height: context.heightR(.02),),
                    DefaultButton(
                      text: 'Save',
                      press: () {
                        addAddress.insert(AddressModel(
                            country: notifier.countryController.text,
                            city: notifier.cityController.text,
                            street: notifier.streetController.text,
                            postcode: notifier.postalCodeController.text,
                        ),
                        );
                        AutoRouter.of(context).pop();
                      },
                    )
                  ],
                ),
            ),
          ],
        ),
    ),
  );
}
