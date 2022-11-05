import 'package:flutter/material.dart';
import '../../data/models/cart_list_data_model.dart';
import '../../../common/const/string_assets.dart';

class CartScreen extends StatefulWidget {
  final List<CartListDataModel>? cartList;
  const CartScreen({Key? key, this.cartList}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: const Text(
          cart,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: widget.cartList?.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black26,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(2), // Border width
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(90), // Image radius
                        child: Image.asset(
                          widget.cartList?[index].img ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    widget.cartList?[index].name ?? '',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        widget.cartList?[index].count ?? '',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
