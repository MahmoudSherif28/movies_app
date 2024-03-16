import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  String _searchQuery = "";

  List<String> _data = [
  ];

  List<String> _searchResults = [];

  void _search() {
    String query = _controller.text;
    List<String> results = [];

    if (query.isNotEmpty) {
      results = _data.where((item) =>
          item.toLowerCase().contains(query.toLowerCase())).toList();
    }

    setState(() {
      _searchResults = results;
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.grey,), onPressed: () {
          Navigator.pop(context);
        },),
        backgroundColor: Color(0xff111111),
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
            ),
          ),
          onChanged: (value) => _search(),
        ),
      ),
      body: _searchResults.isNotEmpty
          ? ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index]),
          );
        },
      )
          : Center(
        child: Text(
          _searchQuery.isEmpty ? 'Start searching...' : 'No results found.',
        style: (TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}