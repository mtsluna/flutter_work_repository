import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/provider.dart';
import 'package:login_app/src/models/product_model.dart';
import 'package:login_app/src/pages/product_page.dart';
import 'package:login_app/src/providers/product_provider.dart';

class HomePage extends StatelessWidget {

  static final routeName = "home";  
  final ProductProvider productProvider = new ProductProvider();

  @override
  Widget build(BuildContext context) {

  final bloc = Provider.of(context);  

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      body: _createList(),
      floatingActionButton: _createButton(context),
    );
  }

  FloatingActionButton _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () { Navigator.pushNamed(context, ProductPage.routeName); },
    );
  }

  _createList() {
    return FutureBuilder(
      future: productProvider.get(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i){
              return _createListItem(context, snapshot.data[i]);
            },
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _createListItem(BuildContext context, Product product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        productProvider.delete(product.id);
      },
      child: ListTile(
        title: Text('${product.name}'),
        subtitle: Text('ID: ${product.id}'),
        trailing: Text(
          '\$${product.price}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, ProductPage.routeName, arguments: product);
        },
      ),
    );
  }
}