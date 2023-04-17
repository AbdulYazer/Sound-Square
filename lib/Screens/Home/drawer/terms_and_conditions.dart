import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: rootBundle.loadString('assets/markdown/termsAndConditions.md'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                  data: snapshot.data!,
                  styleSheet: MarkdownStyleSheet.fromTheme(
                    ThemeData(
                        textTheme:  const TextTheme(
                            bodyText2:
                                TextStyle(fontSize: 16,color: Colors.black ),)),
                  ));
            }
            return const Center(child:  CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}