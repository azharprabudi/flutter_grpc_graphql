import 'package:client/blocs/article.dart';
import 'package:client/pages/grpc/article.dart';
import 'package:client/utils/flag.dart';
import 'package:client/widgets/shared/bloc_provider.dart';
import 'package:flutter/material.dart';

Widget _baseScreen(Widget _defaultScreen) => MaterialApp(
      home: _defaultScreen,
    );

void main() => runApp(
      (() {
        if (isFeatureAvailable(GRPC_SCREEN)) {
          return _baseScreen(
            BlocProvider<ArticleBloc>(
              bloc: ArticleBloc(),
              child: Article(),
            ),
          );
        }

        return _baseScreen(Article());
      })(),
    );
