class Button {
  final int id;
  final String text;
  final int color;
  final bool isBig;

  const Button({
    required this.id, 
    required this.text, 
    this.color = 0xff333333, 
    this.isBig = false, 
  });

  Button copyWith({int? id, String? text, int? color, bool? isBig}) => Button(
    id: id ?? this.id,
    text: text ?? this.text,
    color: color ?? this.color,
    isBig: isBig ?? this.isBig,
  );

  static const buttons = [
    //-Row 1
    Button(id: 1, text: 'AC',  color: 0xffA5A5A5),
    Button(id: 2, text: '+/-', color: 0xffA5A5A5),
    Button(id: 3, text: 'del', color: 0xffA5A5A5),
    Button(id: 4, text: '÷',   color: 0xffF0A23B),

    //-Row 2
    Button(id: 5, text: '7'),
    Button(id: 6, text: '8'),
    Button(id: 7, text: '9'),
    Button(id: 8, text: 'x', color: 0xffF0A23B),

    //-Row 3
    Button(id: 9,  text: '4'),
    Button(id: 10, text: '5'),
    Button(id: 11, text: '6'),
    Button(id: 12, text: '-', color: 0xffF0A23B),

    //-Row 4
    Button(id: 13, text: '1'),
    Button(id: 14, text: '2'),
    Button(id: 15, text: '3'),
    Button(id: 16, text: '+', color: 0xffF0A23B),

    //-Row 5
    Button(id: 17, text: '0', isBig: true),
    Button(id: 18, text: '.'),
    Button(id: 19, text: '=', color: 0xffF0A23B),
  ];
}

