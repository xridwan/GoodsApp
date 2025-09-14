import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/asset/asset_cubit.dart';
import '../bloc/asset/asset_state.dart';
import '../widgets/asset_item_widget.dart';
import '../widgets/search_text_field.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'List Asset',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox.square(dimension: 12),
                    SearchTextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        context.read<AssetsCubit>().fetchAssets(
                          page: 1,
                          pageSize: 10,
                          search: value,
                        );
                      },
                    ),
                    SizedBox.square(dimension: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: BlocBuilder<AssetsCubit, AssetsState>(
                              builder: (context, state) {
                                if (state is AssetsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is AssetsSuccess) {
                                  final assets = state.response.results;
                                  print("Data asset view: $assets}");
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: assets.length,
                                    itemBuilder: (context, index) =>
                                        AssetItemWidget(
                                          asset: assets[index],
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/edit',
                                              arguments: assets[index].id,
                                            );
                                          },
                                        ),
                                  );
                                } else if (state is AssetsFailure) {
                                  return Center(child: Text(state.message));
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
