import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/fragments/test/vm_fragment_quiz.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../core/resources/_r.dart';
import '../../widgets/widget_app_bar.dart';
import '../../widgets/widgets_text.dart';

class FragmentTimesheet extends StatefulWidget {
  const FragmentTimesheet({Key? key}) : super(key: key);

  @override
  State<FragmentTimesheet> createState() => _FragmentTimesheetState();
}

class _FragmentTimesheetState extends State<FragmentTimesheet> with AutomaticKeepAliveClientMixin<FragmentTimesheet>, BaseView {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentTest>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentTest(
        systemPadding(context).top,
        apiService(context),
      ),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              R.color.gray.shade300,
              R.color.gray.shade400,
            ],
          ),
          body: _getBody(context, viewModel),
          appBar: _getAppBar(
            context,
            viewModel,
          ),
        );
      },
    );
  }

  AppBarBasic _getAppBar(BuildContext context, ViewModelFragmentTest viewModel) {
    return AppBarBasic(
      bgColor: R.color.gray.shade700,
      leading: SvgPicture.asset(
        R.drawable.svg.logo,
        height: 20.0,
      ),
      bottomBorderColor: R.color.primary,
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentTest viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 10.0, right: 10.0),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              backgroundColor: Colors.blueGrey,
              minHeight: 15,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              value: viewModel.loadingProcessValue(),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                viewModel.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        _getOptionButton(viewModel.questionList[viewModel.questionNumber].options[0], "A", viewModel),
        _getOptionButton(viewModel.questionList[viewModel.questionNumber].options[1], "B", viewModel),
        _getOptionButton(viewModel.questionList[viewModel.questionNumber].options[2], "C", viewModel),
        _getOptionButton(viewModel.questionList[viewModel.questionNumber].options[3], "D", viewModel),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                child: Icon(Icons.navigate_before),
                onTap: () => setState(() {
                      viewModel.passedQuestion();
                      viewModel.userPickedAnswer = null;
                    })),
            TextBasic(
                color: R.color.black,
                fontFamily: R.fonts.interSemiBold,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                text: (viewModel.questionNumber + 1).toString() + "/" + viewModel.questionList.length.toString()),
            GestureDetector(
                child: Icon(Icons.navigate_next),
                onTap: () => setState(() {
                      viewModel.nextQuestion();
                      viewModel.userPickedAnswer = null;
                    })),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _getOptionButton(String text, String option, ViewModelFragmentTest viewModel) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: viewModel.getOptionColor(option),
            side: BorderSide(
              width: 1.0,
              color: R.color.bottomNavigatorColor,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            checkAnswer(option, viewModel);
          },
        ),
      ),
    );
  }

  void checkAnswer(String userPickedAnswer, ViewModelFragmentTest viewModel) {
    viewModel.userPickedAnswer = userPickedAnswer;

    setState(() {
      if (viewModel.isFinished() == true) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Finished'),
            content: const Text('Quiz is over.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Start Again'),
              ),
            ],
          ),
        );
        viewModel.reset();
      } else {
        //viewModel.nextQuestion();
      }
    });
  }
}
