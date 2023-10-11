import 'package:flutter/material.dart';

class NewsScreenView extends StatefulWidget {
  const NewsScreenView({Key? key}) : super(key: key);

  @override
  State<NewsScreenView> createState() => _NewsScreenViewState();
}

class _NewsScreenViewState extends State<NewsScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // 경계선 및 그림자 제거
          backgroundColor: Colors.white,
          // 배경색을 하얀색으로 설정
          titleSpacing: 0.0,
          leading: Align(
            alignment: Alignment(0, 0.3),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            '독 뉴스',
            style: TextStyle(
              color: Color(0xFF323232),
              fontSize: 22,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 10, // 예시로 10개의 뉴스
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 10.0, 13.0, 2.0),
              child: SizedBox(
                height: 240,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1.20,
                          color: Color(0xFFB5B7B4),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: ListTile(
                      title: Text('뉴스 제목 $index'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    width: double.infinity,
                                    height: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('뉴스 내용 $index'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const NewsScreenView());
}