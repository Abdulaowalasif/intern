import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern/cubit/category_cubit/category_cubit.dart';
import 'package:intern/cubit/provider_cubit/provider_cubit.dart';
import 'package:intern/cubit/service_cubit/service_cubit.dart';
import 'package:intern/cubit/slider_cubit/slider_cubit.dart';
import 'package:intern/model/provider_lists_model.dart';
import 'package:intern/widgets/categories_list.dart';
import 'package:intern/widgets/custom_bottom_navigation.dart';
import 'package:intern/widgets/image_slider.dart';
import 'package:intern/widgets/post_job.dart';
import 'package:intern/widgets/rounded_search.dart';
import 'package:intern/widgets/service_card.dart';
import 'package:intern/widgets/user_list.dart';

import '../model/categories_model.dart';
import '../model/services_model.dart' hide Category;
import '../model/slider_lists_model.dart';
import '../widgets/address_widget.dart';
import '../widgets/notification_cart_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  void initState() {
    context.read<CategoryCubit>().fetchCategories();
    context.read<SliderCubit>().fetchSliders();
    context.read<ProviderCubit>().fetchProviders();
    context.read<ServiceCubit>().fetchServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top bar
            Stack(
              children: [
                Container(
                  height: 187,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff3592FC), Color(0xff175CDE)],
                    ),
                  ),
                ),
                const AddressWidget(),
                const NotificationCartRow(),
                const CustomSearch(),
              ],
            ),
            const SizedBox(height: 20),
            //categories
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CategoryFetchedErrorState) {
                  return Center(child: Text(state.error));
                }
                if (state is CategoryFetchedSuccessState) {
                  final List<Category> categories = state.categories;
                  return SizedBox(
                    height: 128,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return Categories(
                          url: categories[index].image,
                          label: categories[index].name,
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 10),
            //services
            BlocBuilder<ServiceCubit, ServiceState>(
              builder: (context, state) {
                if (state is ServiceLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ServiceFetchedErrorState) {
                  return Center(child: Text(state.error));
                }
                if (state is ServiceFetchedSuccessState) {
                  print("Got success state with ${state.services
                      .length} services");
                  if (state.services.isEmpty) {
                    return Center(child: Text("No services found"));
                  }
                  List<Service> data = state.services;
                  return SizedBox(
                    height: 340,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final service = data[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ServiceCard(
                            imageUrl: service.image,
                            title: service.title,
                            rating: service.averageRating,
                            duration: '1h',
                            category: service.category.name,
                            location: service.admin?.serviceLocation.address ??
                                'No address',
                            price: service.discountPrice.toString(),
                            originalPrice: service.price.toString(),
                            providerName: service.provider?.fullName ??
                                service.admin?.name ?? 'Unknown',
                            providerImage: service.provider?.image ??
                                service.admin?.image ??
                                'https://via.placeholder.com/150',
                          ),
                        );
                      },
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),

            const SizedBox(height: 20),
            //image slider
            BlocBuilder<SliderCubit, SliderState>(
              builder: (context, state) {
                if (state is SliderLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is SliderFetchedErrorState) {
                  return Center(child: Text(state.error));
                }
                if (state is SliderFetchedSuccessState) {
                  final List<String> sliders = state.sliders
                      .map((slider) => slider.image)
                      .toList();

                  if (sliders.isEmpty) {
                    return const Center(child: Text("No sliders available."));
                  }
                  return CarouselWithIndicator(imageUrls: sliders);
                }
                return Container();
              },
            ),
            const SizedBox(height: 20),
            //service provider
            BlocBuilder<ProviderCubit, ProviderState>(
              builder: (context, state) {
                if (state is ProviderLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ProviderFetchedErrorState) {
                  return Center(child: Text(state.error));
                }

                if (state is ProviderFetchedSuccessState) {
                  final data = state.providers;
                  if (data.isEmpty) {
                    return const Center(child: Text("No providers found."));
                  }

                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final provider = data[index];

                        final role = provider.serviceCategories.isNotEmpty
                            ? provider.serviceCategories.first.name
                            : 'No category';

                        final imageUrl = provider.storeImages.isNotEmpty
                            ? provider.storeImages.first
                            : 'https://via.placeholder.com/150';

                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ProfileCard(
                            name: provider.fullName,
                            role: role,
                            imageUrl: imageUrl,
                            rating: provider.averageRating,
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),
            PostJob(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: index,
        onItemSelected: (val) {
          setState(() {
            index = val;
          });
        },
      ),
    );
  }
}
