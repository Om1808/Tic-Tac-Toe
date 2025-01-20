import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayOh = ['', '', '', '', '', '', '', '', ''];

  bool ohTurn = true;
  int tapCounter = 0;
  int ohScore = 0;
  int xScore = 0;

  static var myNewFont =TextStyle(fontFamily: 'PressStart2p-Regular');

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayOh[i] = '';
      }
    });
    tapCounter = 0;
  }

  void showWinner(String w) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFFFF8E7),
            title: Text(
              "$w Is Winner",
              style: myNewFont,
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF28A745)),
                  child: Text(
                    "Play Again",
                    style: myNewFont,
                  ))
            ],
          );
        });
    if (w == 'O') {
      ohScore += 1;
    } else if (w == 'X') {
      xScore += 1;
    }
  }

  void showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFFFF8E7),
            title: Text(
              "It's a Draw",
              style: myNewFont,
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF28A745)),
                  child: Text(
                    "Play Again",
                    style: myNewFont,
                  ))
            ],
          );
        });
  }

  void showHint() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Opacity(
            opacity: 0.7,
            child: AlertDialog(
              title: Text(
                "HOW TO PLAY ",
                style: GoogleFonts.baloo2(),
              ),
              content: Text(
                  "1. Player O goes first.\n"
                  "2. Players alternate turns, placing O or X in an empty square.\n"
                  "3. The first player to get 3 marks in a row (vertically, horizontally, or diagonally) wins the game.\n"
                  "4. If all squares are filled and no player has 3 in a row, the game is a draw.",
                  style: GoogleFonts.baloo2()),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Ok Got It ",
                    style: GoogleFonts.baloo2(color: Colors.black),
                  ),
                )
              ],
            ),
          );
        });
  }

  void checkWinner() {
    if (displayOh[0] == displayOh[1] &&
        displayOh[0] == displayOh[2] &&
        displayOh[0] != '') {
      showWinner(displayOh[0]);
    }
    if (displayOh[3] == displayOh[4] &&
        displayOh[3] == displayOh[5] &&
        displayOh[3] != '') {
      showWinner(displayOh[3]);
    }
    if (displayOh[6] == displayOh[7] &&
        displayOh[6] == displayOh[8] &&
        displayOh[6] != '') {
      showWinner(displayOh[6]);
    }
    if (displayOh[0] == displayOh[3] &&
        displayOh[0] == displayOh[6] &&
        displayOh[0] != '') {
      showWinner(displayOh[0]);
    }
    if (displayOh[1] == displayOh[4] &&
        displayOh[1] == displayOh[7] &&
        displayOh[1] != '') {
      showWinner(displayOh[1]);
    }
    if (displayOh[2] == displayOh[5] &&
        displayOh[2] == displayOh[8] &&
        displayOh[2] != '') {
      showWinner(displayOh[2]);
    }
    if (displayOh[0] == displayOh[4] &&
        displayOh[0] == displayOh[8] &&
        displayOh[0] != '') {
      showWinner(displayOh[0]);
    }
    if (displayOh[2] == displayOh[4] &&
        displayOh[2] == displayOh[6] &&
        displayOh[2] != '') {
      showWinner(displayOh[2]);
    } else if (tapCounter == 9) {
      showDraw();
    }
  }

  void tapped(int index) {
    setState(() {
      if (ohTurn && displayOh[index] == '') {
        displayOh[index] = 'O';
        tapCounter += 1;
        ohTurn = !ohTurn;
      } else if (!ohTurn && displayOh[index] == '') {
        displayOh[index] = 'X';
        tapCounter += 1;
        ohTurn = !ohTurn;
      }
    });
    checkWinner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEAEAEA),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Player X", style: myNewFont),
                                  Text(xScore.toString(), style: myNewFont),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Player O",
                                    style: myNewFont,
                                  ),
                                  Text(ohScore.toString(), style: myNewFont),
                                ],
                              ),
                            )
                          ],
                        )),
                    Positioned(
                      left: 0,
                      child: IconButton(
                          onPressed: showHint, icon: Icon(Icons.help_outline)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color(0xFFF9D371),
                                border: Border.all(color: Color(0xFF34495E)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 4))
                                ]),
                            child: Center(
                              child: Text(
                                displayOh[index],
                                style:
                                    TextStyle(color: Colors.black, fontSize: 40),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      "Tic Tac Toe",
                      style: myNewFont,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "@CREATEDBYOMKAR",
                      style: myNewFont,
                    )
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
