import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostJob extends StatelessWidget {
  const PostJob({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width*0.6;

    return Container(
      color: CupertinoColors.white,
      width: double.infinity,
      height: 450,
      child: Column(
        children: [
          Image.asset('assets/img.png'),
          const SizedBox(height: 20),
          Text(
            'Post a job',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Didn’t find what you’re looking for?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.black.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 40,
              width: width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff175CDE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Post a Job',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
