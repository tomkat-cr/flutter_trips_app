import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final String heroTag;

  FloatingActionButtonGreen({Key? key,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  bool _pressed = false;

  void _onPressedFav() {
    setState(() {
      _pressed = !this._pressed;
    });
    // SnackBar(content: Text(this._pressed ? 'Eliminado de Favoritos' : 'Agregado a Favoritos'));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: widget.heroTag,
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: _onPressedFav,
      child: Icon(
          this._pressed ? Icons.favorite : Icons.favorite_border
      ),
    );
  }
}