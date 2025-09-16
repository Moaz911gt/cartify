import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/home/presentation/views/widgets/all_categorys.dart';
import 'package:project2/features/home/presentation/views/widgets/carousel_slider_widget.dart';
import 'package:project2/features/home/presentation/views/widgets/custom_card.dart';
import 'package:project2/features/home/presentation/views/widgets/profile_app_bar.dart';
import 'package:project2/features/home/presentation/views/widgets/search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductCubit>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, stata) {
          if (stata is Productlooding) {
            return Center(child: CircularProgressIndicator());
          }
          if (stata is Productfailure) {
            return const Center(child: Text('error'));
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .04,
              vertical: size.height * .01,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: size.height * .05)),

                SliverToBoxAdapter(child: ProfileAppBar()),
                SliverToBoxAdapter(child: SizedBox(height: size.height * .03)),

                SliverToBoxAdapter(child: CustomSearchBar(hintText: 'search')),
                SliverToBoxAdapter(child: SizedBox(height: size.height * .03)),
                SliverToBoxAdapter(child: CarouselSliderWidget()),
                SliverToBoxAdapter(child: SizedBox(height: size.height * .02)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * .04),

                    child: AllCategories(cubit: cubit),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 40)),
                SliverGrid.builder(
                  itemCount:
                      (cubit.filterdProducts ?? cubit.allProductsModel)!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    mainAxisSpacing: size.height * .02,
                    crossAxisSpacing: size.height * .02,
                  ),
                  itemBuilder: (context, index) {
                    final productsList =
                        cubit.filterdProducts ?? cubit.allProductsModel!;
                    return CustomCard(product: productsList[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
