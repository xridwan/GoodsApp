import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/widgets/drop_down_location_widget.dart';
import 'package:goods_app/presenter/widgets/drop_down_status_widget.dart';
import 'package:goods_app/presenter/widgets/success_input_dialog.dart';
import 'package:goods_app/presenter/widgets/text_field_custom_widget.dart';

import '../../core/di/app_injection.dart';
import '../bloc/createasset/create_asset_cubit.dart';
import '../bloc/createasset/create_asset_state.dart';
import '../bloc/location/location_cubit.dart';
import '../bloc/location/location_state.dart';
import '../bloc/status/status_cubit.dart';
import '../bloc/status/status_state.dart';
import '../widgets/button_primary_widget.dart';

class InputAssetPage extends StatefulWidget {
  final String? idStatus;

  const InputAssetPage({super.key, this.idStatus});

  @override
  State<InputAssetPage> createState() => _InputAssetPageState();
}

class _InputAssetPageState extends State<InputAssetPage> {
  late final TextEditingController nameController;
  String? selectedStatus;
  String? selectedLocation;

  bool showNameError = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    selectedStatus = widget.idStatus;
    selectedLocation = widget.idStatus;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _onCreatePressed() {
    setState(() {
      showNameError = nameController.text.trim().isEmpty;
    });

    if (!showNameError && selectedStatus != null && selectedLocation != null) {
      context.read<CreateAssetCubit>().createAsset(
        nameController.text.trim(),
        selectedStatus!,
        selectedLocation!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<StatusCubit>()..getStatuses()),
        BlocProvider(create: (context) => sl<LocationCubit>()..getLocations()),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'Input Asset',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fill this form \nbelow',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox.square(dimension: 32),

                        Text(
                          'Asset Name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox.square(dimension: 8),

                        TextFieldCustomWidget(
                          controller: nameController,
                          icon: null,
                          iconPassword: null,
                          hintText: "Input Name",
                          showError: showNameError,
                        ),

                        SizedBox.square(dimension: 8),

                        BlocBuilder<StatusCubit, StatusState>(
                          builder: (context, state) {
                            if (state is StatusSuccess) {
                              final status = state.statuses;
                              return DropDownStatusWidget(
                                title: "Status",
                                items: status,
                                value: selectedStatus,
                                onChanged: (val) {
                                  setState(() => selectedStatus = val);
                                },
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),

                        SizedBox.square(dimension: 12),

                        BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, state) {
                            if (state is LocationSuccess) {
                              final locations = state.locations;
                              return DropDownLocationWidget(
                                title: "Location",
                                items: locations,
                                value: selectedLocation,
                                onChanged: (val) {
                                  setState(() => selectedLocation = val);
                                },
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        SizedBox.square(dimension: 100),
                      ],
                    ),
                  ),
                ),

                BlocListener<CreateAssetCubit, CreateAssetState>(
                  listener: (BuildContext context, CreateAssetState state) {
                    if (state is CreateAssetSuccess) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => SuccessInputDialog(
                          desc: "Data has been submitted.",
                        ),
                      );

                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context).pop(true);
                      });
                    } else if (state is CreateAssetFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: ButtonPrimaryWidget(
                    text: 'Submit',
                    fontSize: 16,
                    onPressed: () {
                      _onCreatePressed();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
