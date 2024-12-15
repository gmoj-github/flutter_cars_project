import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/api/api_response.dart';
import 'package:flutter_cars/api/cars_api.dart';
import 'package:flutter_cars/models/car.dart';
import 'package:flutter_cars/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
      future: CarsApi.getCars(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        ApiResponse response = snapshot.data!;
        return _listView(response.result);
      },
    );
  }

  _listView(cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            Car car = cars[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        car.urlPhoto!,
                        width: 150,
                      ),
                    ),
                    Text(
                      car.name!,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('DETAILS'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
