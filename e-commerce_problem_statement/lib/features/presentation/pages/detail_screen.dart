import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/features/data/models/cart_list_data_model.dart';
import 'package:untitled/features/presentation/bloc/cart/cart_bloc.dart';
import 'package:untitled/features/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:untitled/features/presentation/pages/cart_screen.dart';
import '../../../common/const/string_assets.dart';
import '../../data/models/item_list_data_model.dart';
import '../../../common/const/images_assets.dart';

class DetailScreen extends StatefulWidget {
  final ItemListData? itemListData;
  const DetailScreen({Key? key, this.itemListData}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cartCount = 0;
  List<CartListDataModel> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          details,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartScreen(cartList:cartList,)));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is ProductAdded) {
            cartCount = state.count ?? 0;
            cartCount++;
            if(cartList.isEmpty){
              cartList.add(CartListDataModel(
                  img: state.itemListData?.img, name: state.itemListData?.name,count:cartCount.toString()));
            }else{
              for (var element in cartList) {
                if(element.name == state.itemListData?.name){
                  element.count = cartCount.toString();
                }
              }
            }


          } else if (state is ProductRemoved) {
            cartCount = state.count ?? 0;
            cartCount--;
            if(cartCount == 0){
              cartList.clear();
            }else{
              for (var element in cartList) {
                if(element.name == state.itemListData?.name){
                  element.count = cartCount.toString();
                }
              }
            }

          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                color: Colors.black26,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(90)),
                    color: Colors.lightBlue.withOpacity(0.5),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 6.5,
                bottom: 0,
                right: 0,
                left: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5), // Border width
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(90), // Image radius
                              child: Image.asset(
                                widget.itemListData?.img ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.itemListData?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<DashboardBloc>().add(
                                          ProductLikeDislikeEvent(
                                              itemListData:
                                                  widget.itemListData));
                                    },
                                    child: SvgPicture.asset(
                                      widget.itemListData?.isLike ?? false
                                          ? AssetsImages.icLike
                                          : AssetsImages.icDisLike,
                                      height: 20,
                                      width: 20,
                                      color:
                                          widget.itemListData?.isLike ?? false
                                              ? Colors.red
                                              : Colors.white,
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              details,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          ProductRemoveInCartEvent(
                                              count: cartCount,
                                              itemListData:
                                                  widget.itemListData));
                                    },
                                    child: Container(
                                      height: 25,
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 5.0),
                                    child: Text(
                                      cartCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          ProductAddInCartEvent(
                                              count: cartCount,
                                              itemListData:
                                                  widget.itemListData));
                                    },
                                    child: Container(
                                      height: 25,
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          descFood1,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              reviews,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: ListView.builder(
                                itemCount: widget.itemListData?.rating,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  '\u{20B9}${widget.itemListData?.prize ?? ''}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(90),
                    ),
                    color: Colors.black26.withOpacity(0.5),
                  ),
                  child: const Center(
                      child: Text(
                    buyNow,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              )
              /* Positioned(
           bottom:10,
            child: Padding(
              padding: const EdgeInsets.only(left:10,right:10),
              child: Row(
                children:  [
                  const Text(
                    '\u{20B9}${100 ?? ''}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          )*/
            ],
          );
        },
      ),
    );
  }
}
