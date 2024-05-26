import 'package:flutter/material.dart';
import 'package:flutter_ai/module/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.grey,
            body: Center(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width > 600
                    ? 400
                    : MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/pattern.jpg",
                        repeat: ImageRepeat.repeat,
                        opacity: AlwaysStoppedAnimation(.5),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ListView.builder(
                        itemCount: value.listChat.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, i) {
                          final data = value.listChat[i];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: data.posisi == "kanan" ? Colors.green[200] : Colors.blue),
                            margin: EdgeInsets.only(
                              bottom: 8,
                              left: data.posisi == 'kanan' ? 80 : 16,
                              right: data.posisi == 'kiri' ? 80 : 16,
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "${data.chat}",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          );
                        } ,
                      ),
                    ),
                    // Positioned(
                    //   top: 50,
                    //   left: 0,
                    //   right: 0,
                    //   bottom: 60,
                    //   child: ListView(
                    //     reverse: true,
                    //     children: value.chats
                    //         .map((e) => Container(
                    //               margin: EdgeInsets.only(
                    //                   bottom: 8, left: 80, right: 16),
                    //               padding: EdgeInsets.all(8),
                    //               decoration: BoxDecoration(
                    //                   color: Colors.blue[200],
                    //                   borderRadius: BorderRadius.circular(16)),
                    //               child: Text(e),
                    //             ))
                    //         .toList(),
                    //   ),
                    // ),
                    
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                controller: value.chat,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: value.sendMessage,
                                    icon: Icon(Icons.send),
                                  ),
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.camera_alt,
                              size: 20,
                            ),
                            Icon(
                              Icons.mic,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        color: Color.fromARGB(255, 62, 47, 47),
                        child: Row(
                          children: [
                            Image.asset("assets/profilee.jpeg",
                                repeat: ImageRepeat.repeat),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
