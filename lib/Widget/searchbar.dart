import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  SearchBar({required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  void _performSearch() {
    final cityName = _controller.text.trim();
    if (cityName.isNotEmpty) {
      widget.onSearch(cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter city name',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: _performSearch,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        onSubmitted: (_) => _performSearch(),
      ),
    );
  }
}
  // //DAY and time
  //             Row(children: [
  //             Padding(padding:EdgeInsets.only(left:150)),
  //               Text('${_weather?.list[7].dtTxt.day.toString() ?? "No time"}-',style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //               ),),
  //               Text('${_weather?.list[7].dtTxt.month.toString() ?? "No time"}-',style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //               ),),Text('${_weather?.list[7].dtTxt.year.toString() ?? "No time"}',style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //               ),),
  //               Text('  ${_weather?.list[7].sys.pod.name.toString() ?? "No time"}',style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //               ),),
  //             ],),
            