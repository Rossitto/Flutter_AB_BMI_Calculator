import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_card.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(Gender gender) {
    //male card pressed
    if (gender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    //female card pressed
    if (gender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        maleCardColour = inactiveCardColour;
        femaleCardColour = activeCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColour,
                        cardChild: IconCard(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColour,
                        cardChild: IconCard(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColour,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
