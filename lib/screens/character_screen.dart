import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterScreen extends StatelessWidget {
  final character;

  CharacterScreen(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SlidingUpPanel(
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 16.0)],
        defaultPanelState: PanelState.OPEN,
        maxHeight: MediaQuery.of(context).size.height - 450,
        minHeight: MediaQuery.of(context).size.height - 450,
        panel: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Name:', style: TextStyle(fontSize: 20)),
                  Text(character['name'], style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Status:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(character['status'],
                      style: TextStyle(
                          fontSize: 20,
                          color: character['status'] == 'Alive'
                              ? Colors.green
                              : Colors.red)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Specie:', style: TextStyle(fontSize: 20)),
                  Text(character['species'], style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Gender:', style: TextStyle(fontSize: 20)),
                  Text(character['gender'], style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Location:', style: TextStyle(fontSize: 20)),
                  Flexible(
                    child: Text(character['origin']['name'].toString().contains('(Re') ? 'Earth' : character['origin']['name'],
                        style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: character['id'],
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: character['image'],
                    fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
