import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_app/presenter/widgets/button_red_widget.dart';
import 'package:goods_app/presenter/widgets/custom_dialog_widget.dart';

import '../../core/di/app_injection.dart';
import '../bloc/delete_asset/delete_asset_cubit.dart';
import '../bloc/delete_asset/delete_asset_state.dart';
import '../bloc/detail_asset/detail_asset_cubit.dart';
import '../bloc/detail_asset/detail_asset_state.dart';
import '../bloc/location/location_cubit.dart';
import '../bloc/location/location_state.dart';
import '../bloc/status/status_cubit.dart';
import '../bloc/status/status_state.dart';
import '../bloc/update_asset/update_asset_cubit.dart';
import '../bloc/update_asset/update_asset_state.dart';
import '../widgets/button_primary_widget.dart';
import '../widgets/drop_down_location_widget.dart';
import '../widgets/drop_down_status_widget.dart';
import '../widgets/success_input_dialog.dart';
import '../widgets/text_field_custom_widget.dart';

class EditAssetPage extends StatefulWidget {
  final String? id;

  const EditAssetPage({super.key, this.id});

  @override
  State<EditAssetPage> createState() => _EditAssetPageState();
}

class _EditAssetPageState extends State<EditAssetPage> {
  late final TextEditingController nameController;
  String? selectedStatus;
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
    selectedStatus = null;
    selectedLocation = null;
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Edit Asset",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  sl<DetailAssetCubit>()..fetchDetail(widget.id!),
            ),
            BlocProvider(create: (context) => sl<StatusCubit>()..getStatuses()),
            BlocProvider(
              create: (context) => sl<LocationCubit>()..getLocations(),
            ),
          ],
          child: BlocConsumer<DetailAssetCubit, DetailAssetState>(
            listener: (context, state) {
              if (state is DetailAssetSuccess) {
                nameController.text = state.asset.name;
                selectedStatus = state.asset.status.id;
                selectedLocation = state.asset.location.id;
              }
            },
            builder: (context, state) {
              if (state is DetailAssetLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DetailAssetFailure) {
                return Center(child: Text(state.message));
              } else if (state is DetailAssetSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fill this form \nbelow",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox.square(dimension: 32),

                              Text(
                                "Asset Name",
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
                              ),

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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BlocListener<DeleteAssetCubit, DeleteAssetState>(
                              listener: (context, state) {
                                if (state is DeleteAssetSuccess) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      );
                                      return SuccessInputDialog(
                                        desc: "Data has been deleted.",
                                      );
                                    },
                                  );
                                } else if (state is DeleteAssetFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.message)),
                                  );
                                }
                              },
                              child: ButtonRedWidget(
                                text: "Delete",
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => CustomDialogWidget(
                                      title: "Confirmation!",
                                      desc:
                                          "Your action will cause this data\npermanently deleted.",
                                      onAccept: () {
                                        Navigator.pop(context);
                                        context
                                            .read<DeleteAssetCubit>()
                                            .deleteAsset(widget.id!);
                                      },
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox.square(dimension: 12),

                          Expanded(
                            child:
                                BlocListener<
                                  UpdateAssetCubit,
                                  UpdateAssetState
                                >(
                                  listener:
                                      (
                                        BuildContext context,
                                        UpdateAssetState state,
                                      ) {
                                        if (state is UpdateAssetSuccess) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              );
                                              return SuccessInputDialog(
                                                desc: "Data has been updated.",
                                              );
                                            },
                                          );
                                        } else if (state
                                            is UpdateAssetFailure) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(state.message),
                                            ),
                                          );
                                        }
                                      },
                                  child: ButtonPrimaryWidget(
                                    text: "Save Update",
                                    fontSize: 16,
                                    onPressed: () {
                                      context
                                          .read<UpdateAssetCubit>()
                                          .updateAsset(
                                            widget.id!,
                                            nameController.text,
                                            selectedStatus!,
                                            selectedLocation!,
                                          );
                                    },
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
