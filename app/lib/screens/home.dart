import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/clases/class_product.dart';
import '/clases/class_user_info.dart';

class HomeScreen extends StatefulWidget {
  final UserInfo usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController productNameController = TextEditingController();
TextEditingController productDescriptionController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productQuantityController = TextEditingController();

String mostExpensiveName = "";
String cheapestName = "";
String mostQuantityName = "";
String leastQuantityName = "";

late double mostExpensiveNum;
late double cheapestNum;
late int mostQuantityNum;
late int leastQuantityNum;
late double avgPrice;

String mostExpensiveDesc = "";
String cheapestDesc = "";
String mostQuantityDesc = "";
String leastQuantityDesc = "";

int numberOfItems = 0;
double totalPriceOfItems = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ingrese su producto",
                  style: TextStyle(fontSize: 40, color: Colors.blueGrey),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: productNameController,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: productDescriptionController,
                    decoration: InputDecoration(
                      labelText: "Descripción",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: productPriceController,
                    decoration: InputDecoration(
                      labelText: "Precio",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: productQuantityController,
                    decoration: InputDecoration(
                      labelText: "Cantidad",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          final price = double.tryParse(
                            productPriceController.text,
                          );
                          final quantity = int.tryParse(
                            productQuantityController.text,
                          );

                          if (price == null ||
                              quantity == null ||
                              price < 0 ||
                              quantity < 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "La cantidad debe ser un número entero y el precio puede usar '.', ambos positivos",
                                ),
                              ),
                            );
                            productPriceController.clear();
                            productQuantityController.clear();
                            return;
                          }
                          Product product = Product(
                            name: productNameController.text,
                            description: productDescriptionController.text,
                            price: price,
                            quantity: quantity,
                          );

                          if (numberOfItems == 0) {
                            numberOfItems = 1;
                            totalPriceOfItems = product.price;

                            mostExpensiveName = product.name;
                            cheapestName = product.name;
                            mostQuantityName = product.name;
                            leastQuantityName = product.name;

                            mostExpensiveNum = product.price;
                            cheapestNum = product.price;
                            mostQuantityNum = product.quantity;
                            leastQuantityNum = product.quantity;
                            avgPrice = product.price;
                          } else {
                            numberOfItems++;
                            totalPriceOfItems += product.price;

                            //promedio
                            avgPrice = totalPriceOfItems / numberOfItems;

                            if (product.price > mostExpensiveNum) {
                              //caro
                              mostExpensiveNum = product.price;
                              mostExpensiveName = product.name;
                              mostExpensiveDesc = product.description;
                            }
                            //barato
                            if (product.price < cheapestNum) {
                              cheapestNum = product.price;
                              cheapestName = product.name;
                              cheapestDesc = product.description;
                            }
                            //mayor cantidad
                            if (product.quantity > mostQuantityNum) {
                              mostQuantityNum = product.quantity;
                              mostQuantityName = product.name;
                              mostQuantityDesc = product.description;
                            }
                            //menor cantidad
                            if (product.quantity < leastQuantityNum) {
                              leastQuantityNum = product.quantity;
                              leastQuantityName = product.name;
                              leastQuantityDesc = product.description;
                            }
                          }

                          productNameController.clear();
                          productDescriptionController.clear();
                          productPriceController.clear();
                          productQuantityController.clear();
                        },
                        child: Text("Agregar"),
                      ),
                    ),
                    SizedBox(width: 50),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (numberOfItems > 0) {
                            context.push("/show");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Ingrese algún ítem")),
                            );
                          }
                        },
                        child: Text("Calcular"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
