import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:poc_flutter/core/presentation/widgets/pharmacy_list.dart';
import 'package:poc_flutter/core/presentation/widgets/zip_code_header.dart';

class PharmacyListScreen extends StatelessWidget {
  const PharmacyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Column(
            children: [
              const ZipCodeHeader(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        sizingInformation.isDesktop
                            ? MediaQuery.of(context).size.width * 0.32
                            : 16.0,
                    vertical: 16.0,
                  ),
                  child: const PharmacyList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
