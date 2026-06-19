import 'package:flutter/material.dart';
import 'package:login_interfaz/widgets/product_view.dart';
import '/screens/home.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        shadowColor: Colors.blueGrey,
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: const _ProductView(),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView(); //saqué el super.key

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaProductos.length,
      itemBuilder: (context, index) {
        final producto = listaProductos[index];
        return ProductItem(product: producto);
      },
    );
  }
}
