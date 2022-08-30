import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/blocs/model/local/address_model.dart';
import 'package:flutter_boilerplate/blocs/providers/add_address_provider.dart';
import 'package:flutter_boilerplate/generated/locale_keys.g.dart';
import 'package:flutter_boilerplate/routes/custom_router.gr.dart';
import 'package:flutter_boilerplate/services/local/i_address_state.dart';
import 'package:flutter_boilerplate/ui/widgets/default_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.Addresses.tr(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFECDF),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final state = ref.watch(AddAddressProvider.provider);
          if (state is AddressProviderLoaded) {
            return _AddressBody(addresses: state.addresses);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _AddressBody extends ConsumerWidget {
  final List<AddressModel> addresses;

  const _AddressBody({required this.addresses});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(AddAddressProvider.provider.notifier);
    return SizedBox(
      height: context.heightR(1),
      width: double.maxFinite,
      child: Column(
        children: [
          if (addresses.isEmpty)
            SvgPicture.asset(
              'assets/images/location.svg',
              height: context.heightR(.7),
            )
          else
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(UniqueKey().toString()),
                    // UniqueKey().toString()
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      notifier.delete(
                        addresses[index].street,
                      );
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              notifier.delete(
                                addresses[index].street,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    child: _AddressItem(
                      address: addresses[index],
                    ),
                  );
                },
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultButton(
              text: LocaleKeys.addAddress.tr(),
              press: () => AutoRouter.of(context).push(const AddAddressRoute()),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _AddressItem extends StatelessWidget {
  final AddressModel address;

  const _AddressItem({required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECDF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${LocaleKeys.country.tr()}: ${address.country}',
                style: TextStyle(
                  fontSize: context.heightR(0.02),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                address.postcode,
                style: TextStyle(
                  fontSize: context.heightR(0.02),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: context.heightR(0.01)),
          Text(
            '${LocaleKeys.city.tr()}: ${address.city}',
            style:
                TextStyle(fontSize: context.heightR(0.02), color: Colors.black),
          ),
          SizedBox(height: context.heightR(0.01)),
          Text(
            '${LocaleKeys.street.tr()}: ${address.street}',
            style:
                TextStyle(fontSize: context.heightR(0.02), color: Colors.black),
          ),
        ],
      ),
    );
  }
}
