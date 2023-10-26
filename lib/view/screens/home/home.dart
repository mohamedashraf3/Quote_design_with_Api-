import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_task/view_model/bloc/quote_cubit/quote_cubit.dart';
import 'package:quote_task/view_model/bloc/quote_cubit/quote_state.dart';
import 'package:quote_task/view_model/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=QuoteCubit.get(context) ;
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: BlocConsumer<QuoteCubit,QuoteState>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return  SafeArea(
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
                               cubit.quoteModel?.quote?.body.toString() ?? "Loading...",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              cubit.quoteModel?.quote?.author.toString() ?? "Loading...",
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
          );
        },
      ),
    );
  }
}

