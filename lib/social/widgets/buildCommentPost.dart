import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildCommentPost extends StatelessWidget {
  String imageUsers;
  String nameUsers;
  String contentComment;
  String timeAgo;
  BuildCommentPost({
    required this.contentComment,
    required this.imageUsers,
    required this.nameUsers,
    required this.timeAgo,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(imageUsers),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0),
          padding: EdgeInsets.only(left: 7.0, right: 7.0),
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    nameUsers,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                child: Text(
                  contentComment,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
