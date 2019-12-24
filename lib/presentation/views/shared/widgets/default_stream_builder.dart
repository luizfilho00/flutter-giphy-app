import 'package:flutter/material.dart';
import 'package:mymovies/presentation/utils/async_data.dart';
import 'package:mymovies/presentation/views/shared/utils/show_dialog.dart';

import 'loading_placeholder.dart';

class DefaultStreamBuilder extends StatelessWidget {
  final Stream stream;
  final Function loadingAction;
  final Function errorAction;
  final Function retryAction;
  final Widget defaultEmptyPlaceholder;
  final Function successAction;

  DefaultStreamBuilder(this.stream,
      {this.loadingAction,
      this.errorAction,
      this.retryAction,
      this.successAction,
      this.defaultEmptyPlaceholder})
      : assert(stream != null && successAction != null);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AsyncData>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return loadingAction != null
                  ? loadingAction()
                  : LoadingPlaceholder();
            case Status.COMPLETED:
              return successAction(context, snapshot.data.data);
            case Status.ERROR:
              errorAction != null
                  ? errorAction()
                  : showAlertDialog(context,
                      message: snapshot.data.message,
                      retryAction: retryAction ?? retryAction());
              break;
          }
        }
        return defaultEmptyPlaceholder ?? Container();
      },
    );
  }
}
