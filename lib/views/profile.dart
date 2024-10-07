import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var headerImage = Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/bg-material.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF00AA13),
                width: 4.0,
              ),
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/img/me.jpeg'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Irsan Achmad Maulidan',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            'IT Support Intern',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    var personalInfo = Container(
      margin: EdgeInsets.only(top: 100, left: 50, right: 50),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.school,
                color: Color(0xFF00AA13),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Teknik Informatika',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.email,
                color: Color(0xFF00AA13),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'irsanmaulidan21@gmail.com',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFF00AA13),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bekasi, Jawa Barat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Color(0xFF00AA13),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '+6285773127245',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );

    return Stack(
      children: [
        Column(
          children: [headerImage, personalInfo],
        ),
        Container(
          margin: EdgeInsets.only(top: 270, left: 40, right: 40),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 7,
                offset: Offset(2, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Helpdesk',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '8.5',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Maintenance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '8.0',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '8.5',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
