import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortywiki/delegates/data_search.dart';
import 'package:rickandmortywiki/screens/character_screen.dart';
import 'package:rickandmortywiki/stores/character_store.dart';
import 'package:rickandmortywiki/tabs/episodes_tab.dart';
import 'package:rickandmortywiki/tabs/home_tab.dart';
import 'package:rickandmortywiki/tabs/locations_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;
  CharacterStore _characterStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _characterStore = Provider.of<CharacterStore>(context, listen: false);
    _characterStore.getCharacters();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                var result =
                    await showSearch(context: context, delegate: DataSearch());
                if (result != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CharacterScreen(result)));
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          HomeTab(),
          EpisodesTab(),
          LocationsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_video),
            title: Text('Episodes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Locations'),
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
    );
  }
}
