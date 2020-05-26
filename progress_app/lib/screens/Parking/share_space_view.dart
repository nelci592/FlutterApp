import 'package:flutter/widgets.dart';
import '../../models/UserData/user_global_data.dart';

class ShareSpaceView extends StatefulWidget {
  final GlobalUserData model;

  ShareSpaceView({Key key, this.model}) : super(key: key);

  @override
  _ShareSpaceViewState createState() => _ShareSpaceViewState();
}

class _ShareSpaceViewState extends State<ShareSpaceView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('You are sharing your spot from 05 Sep to 17 Sep',
                    style: TextStyle(fontSize: 14))),
          ),
        ),
        Container(
            child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(111, 198, 25, 1),
                  Color.fromRGBO(159, 235, 83, 1)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Center(
              child: GestureDetector(
            onTap: () => {},
            child: GestureDetector(
              onTap: () => {
                GlobalUserData.isSpaceShared = false,
                widget.model.onDataChanged()
              },
              child: Text(
                "Terminate Absence",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18),
              ),
            ),
          )),
        )),
      ],
    );
  }
}
