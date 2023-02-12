import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Reward_page extends StatefulWidget {
  const Reward_page({super.key});

  @override
  State<Reward_page> createState() => _Reward_pageState();
}

class _Reward_pageState extends State<Reward_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(255, 0, 148, 133),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  const Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 6, 49, 52),
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.75,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 90,
                                    ),
                                    const Text(
                                      'Tushar Sharma',
                                      style: TextStyle(
                                        color: Color.fromRGBO(27, 181, 216, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 37,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: const [
                                            Center(
                                              child: Text(
                                                'Credits',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Center(
                                              child: Text(
                                                '15',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      27, 181, 216, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 28,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  
                                  // decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //         image: AssetImage(
                                  //             'img/images/tushar.jpg')),
                                  //     shape: BoxShape.circle,
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //           color: Color.fromARGB(
                                  //               255, 0, 148, 133))
                                  //     ]),
                                  child: Image.asset(
                                    'img/images/tushar.jpg',
                                    width: innerWidth * 0.40,
                                    fit: BoxFit.fill,
                                    
                                    
                                  ),
                                  
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
