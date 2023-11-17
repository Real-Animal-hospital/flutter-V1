import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DogDrHomeScreen extends StatefulWidget {
  const DogDrHomeScreen({super.key});

  @override
  State<DogDrHomeScreen> createState() => _DogDrHomeScreenState();
}

class _DogDrHomeScreenState extends State<DogDrHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  'Dr.doggy',
                  style: TextStyle(
                    color: Color(0xFF43D9C0),
                    fontSize: 32,
                    fontFamily: 'Swagger TTF',
                    fontWeight: FontWeight.w400,
                    height: 0.02,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              const SizedBox(height: 75),
              const Text(
                '견종 선택',
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  height: 0.05,
                  letterSpacing: 0.10,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                width: double.infinity,
                height: 212,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD5EDF6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFD5EDF6)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Row(
                        children: [
                          const Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF717970),
                                radius: 46,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/Ellipse5.png'),
                                radius: 45,
                              ),
                            ],
                          ),
                          const SizedBox(width: 28),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: const Color(0xff43d9c0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                              child: const FittedBox(
                                // 버튼 안의 텍스트가 버튼의 크기를 벗어나지 않도록 설정
                                child: Text(
                                  '견종 선택하기',
                                  style: TextStyle(
                                    color: Color(0xff323232),
                                    fontFamily: 'Pretendard',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xff323232),
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "견종을 선택하고\n",
                          ),
                          TextSpan(
                            text: "다양한 독닥 서비스를 이용해보세요",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('독 뉴스',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      context.go('/news');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '더보기',
                          style: TextStyle(
                            color: Color(0xFF323232),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Color(0xFF323232),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Text('뉴스 $index'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
