import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:untitled/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:untitled/features/presentation/pages/detail_screen.dart';
import '../../../common/const/images_assets.dart';
import '../../../common/const/string_assets.dart';
import '../../data/models/filter_list_data.dart';
import '../../data/models/item_list_data_model.dart';
import '../widgets/filter_tag_widget.dart';
import '../widgets/item_list_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<FilterListData> filterData = [];
  List<ItemListData> itemListData = [];

  bool isLikeDislike = false;

  @override
  void initState() {
    super.initState();

    getFilterData();
  }

  void getFilterData() {
    filterData.addAll(FilterListData.filterTagOptionData());
    getIemListData(0);
  }

  void getIemListData(int index) {
    itemListData.clear();
    if (index == 0) {
      itemListData.addAll(ItemListData.foodListData());
    } else if (index == 1) {
      itemListData.addAll(ItemListData.drinkListData());
    } else {
      itemListData.addAll(ItemListData.fruitListData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is AppliedFilter) {
            if (state.index == 0) {
              getIemListData(state.index);
            } else if (state.index == 1) {
              getIemListData(state.index);
            } else {
              getIemListData(state.index);
            }
          } else if (state is ProductLikeDisLikeState) {}
        },
        builder: (context, state) {
          return Container(
            color: Colors.black26,
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(2), // Border radius
                            child: ClipOval(
                              child: Image.asset(
                                AssetsImages.imgUser,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.notifications,
                          size: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      findTheBest,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: filterData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FilterTagWidget(
                            iconImg: filterData[index].icon,
                            name: filterData[index].name,
                            isSelected: filterData[index].isSelected,
                            onTap: () {
                              context.read<DashboardBloc>().add(
                                    SelectUnselectFilterTagEvent(
                                        filterData[index], filterData, index),
                                  );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(16),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(
                          itemListData.length,
                          (index) {
                            return ItemListWidget(
                              itemListData: itemListData[index],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              itemListData: itemListData[index],
                                            )));
                              },
                              onTapLikeDislike: () {
                                context.read<DashboardBloc>().add(
                                      ProductLikeDislikeEvent(
                                          itemListData: itemListData[index]),
                                    );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width/1.13,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.home),
                        Icon(Icons.deblur),
                        Icon(Icons.waterfall_chart),
                        Icon(Icons.backpack),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
