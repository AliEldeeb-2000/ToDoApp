import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;

  @override
  State createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _payload.toString().split('|')[1],
            style: TextStyle(color: Get.isDarkMode ? white : Colors.black),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Get.isDarkMode ? white : darkGreyClr,),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello , Ali',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Get.isDarkMode ? white : darkGreyClr,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You have anew reminder',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Get.isDarkMode
                            ? Colors.grey.shade500
                            : darkGreyClr),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: Container(
                  padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: primaryClr),
                  child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.text_format,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Title',
                            style: TextStyle(color: white, fontSize: 30),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(_payload.toString().split('|')[0],
                          style: const TextStyle(color: white, fontSize: 20)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.description,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(color: white, fontSize: 30),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(_payload.toString().split('|')[1],
                          style: const TextStyle(
                            color: white,
                            fontSize: 20,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Date',
                            style: TextStyle(color: white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(_payload.toString().split('|')[2],
                          style: const TextStyle(color: white, fontSize: 20)),
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
