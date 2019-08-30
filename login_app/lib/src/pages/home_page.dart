import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/product_bloc.dart';
import 'package:login_app/src/blocs/provider.dart';
import 'package:login_app/src/models/product_model.dart';
import 'package:login_app/src/pages/product_page.dart';

class HomePage extends StatelessWidget {

  static final routeName = "home";  
  
  @override
  Widget build(BuildContext context) {

    final productBloc = Provider.productosBloc(context);
    productBloc.getProduct();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      body: _createList(productBloc),
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

  _createList(ProductBloc productBloc) {

    return StreamBuilder(
      stream: productBloc.getProductStream,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i){
              return _createListItem(context, snapshot.data[i], productBloc);
            },
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _createListItem(BuildContext context, Product product, ProductBloc productBloc) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        productBloc.deleteProduct(product.id);
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