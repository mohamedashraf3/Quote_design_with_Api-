import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quote_task/model/quote_model.dart';
import 'package:quote_task/view_model/data/network/dio_helper.dart';
import 'package:quote_task/view_model/data/network/end_points.dart';
import 'package:quote_task/view_model/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

QuoteModel? quoteModel;
Response? response;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    callApi();
  }

  static void callApi() async {
    response = await DioHelper.get(endPoint: EndPoints.quoteTheDay);
    quoteModel = QuoteModel.fromJson(response?.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.format_quote,
                          color: AppColors.pink.withOpacity(0.7),
                          size: 70,
                        ),
                        Text(
                          quoteModel?.quote?.body.toString() ?? "Loading...",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          quoteModel?.quote?.author.toString() ?? "Loading...",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
