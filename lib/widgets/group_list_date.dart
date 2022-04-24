import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _elements1 = [
  {'name': 'Người nhện', 'date': '24-03-2022'},
  {'name': 'Trăng rơi', 'date': '22-03-2022'},
  {'name': 'Nhện', 'date': '23-03-2022'},
  {'name': 'Người nhện', 'date': '24-03-2022'},
];
var list;
var _elements;

class MyList extends StatefulWidget {
  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  // final ProductStore ProductsStore = ProductStore();
  int kq = 0;
  // List<Product> _elements = ProductsStore.getAllProducts() as List<Product>;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: GroupedListView<dynamic, String>(
          scrollDirection: Axis.vertical,
          groupBy: (element) => element['date'],
          elements: _elements1,
          sort: true,
          groupSeparatorBuilder: (String value) {
            // String kk = "";
            // kq = 0;
            // _elements.forEach((element) {
            //   if (element['date'] == value) {
            //     var tong1 = element['price'];
            //     kq += int.parse(tong1);
            //     kk = element['logo'];
            //     // int tong = int.parse(tong1) +1 ;
            //   }
            // });
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        child: Text(
                          "Lượt xem : -- ${kq}" + " đ",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          order: GroupedListOrder.DESC,
          itemBuilder: (c, element) {
            return Card(
              elevation: 0.5,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child:
                            // CarouselWithIndicatorDemo(),
                            Container(
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            // image: DecorationImage(
                            //     // fit: BoxFit.fill,
                            //     image: AssetImage(element['logo'])),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        element['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(3, 3, 3, 3),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "("
                                          '${element['note'] ?? "KK"}'
                                          ")",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.deepOrangeAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 3, 3, 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    element['price'] ?? "QQ" + " đ",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }

  // _onAddProduct(BuildContext context) async {
  //   Product productAdd = await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             // title: Text("Thêm mới"),
  //             content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Container(
  //                       height: 60,
  //                       child: const Center(
  //                         child: Text('Thêm mới chi tiêu',
  //                             style: TextStyle(
  //                                 fontSize: 20, fontWeight: FontWeight.bold)),
  //                       ),
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.all(Radius.circular(20)),
  //                           border:
  //                               Border.all(width: 1.0, color: Colors.black12)),
  //                     ),
  //                     const Center(
  //                       child: Text('-----------------',
  //                           style: TextStyle(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.blueGrey)),
  //                     ),
  //                     const SizedBox(height: 10.0),
  //                     ProductAdd(),
  //                   ]),
  //             ],
  //           ),
  //         ));
  //       });
  //   if (productAdd != null) {
  //     ProductsStore.save(productAdd);
  //   }
  // }
}
