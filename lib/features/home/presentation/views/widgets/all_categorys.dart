import 'package:flutter/material.dart';
import 'package:project2/features/home/presentation/manager/home%20cubit/cubit/product_cubit.dart';
import 'package:project2/features/home/presentation/views/widgets/category_item.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key, required this.cubit});

  final ProductCubit cubit;

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  String selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Categorys',

            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 40,
            children: [
              CategoryItem(
                onPressed: () {
                  widget.cubit.filterByCategory(category: 'all');
                  setState(() {
                    selectedCategory = 'all';
                  });
                },

                icon: Icon(
                  Icons.grid_view,
                  color: selectedCategory == 'all' ? Colors.blue : Colors.grey,
                ),
                categoryName: 'all',
              ),

              CategoryItem(
                onPressed: () {
                  widget.cubit.filterByCategory(category: 'electronics');
                  setState(() {
                    selectedCategory = 'electronics';
                  });
                },
                icon: Icon(
                  Icons.bolt,
                  color: selectedCategory == 'electronics'
                      ? Colors.blue
                      : Colors.grey,
                ),
                categoryName: 'electronics',
              ),

              CategoryItem(
                onPressed: () {
                  widget.cubit.filterByCategory(category: 'jewelery');
                  setState(() {
                    selectedCategory = 'jewelery';
                  });
                },
                icon: Icon(
                  Icons.diamond,
                  color: selectedCategory == 'jewelery'
                      ? Colors.blue
                      : Colors.grey,
                ),
                categoryName: 'jewelery',
              ),

              CategoryItem(
                onPressed: () {
                  widget.cubit.filterByCategory(category: 'men\'s clothing');
                  setState(() {
                    selectedCategory = 'men\'s clothing';
                  });
                },
                icon: Icon(
                  Icons.man,
                  color: selectedCategory == 'men\'s clothing'
                      ? Colors.blue
                      : Colors.grey,
                ),
                categoryName: 'men\'s cloths',
              ),

              CategoryItem(
                onPressed: () {
                  widget.cubit.filterByCategory(category: 'women\'s clothing');
                  setState(() {
                    selectedCategory = 'women\'s clothing';
                  });
                },
                icon: Icon(
                  Icons.woman,
                  color: selectedCategory == 'women\'s clothing'
                      ? Colors.blue
                      : Colors.grey,
                ),
                categoryName: 'women\'s cloths',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
