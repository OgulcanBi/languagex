import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widget_tabbar.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/resources/_r.dart';
import '../../widgets/feature_box.dart';
import '../../widgets/widget_app_bar.dart';
import 'openai_service.dart';
import 'vm_fragment_speaking.dart';

class FragmentSpeaking extends StatefulWidget {
  const FragmentSpeaking({Key? key}) : super(key: key);

  @override
  State<FragmentSpeaking> createState() => _FragmentSpeakingState();
}

class _FragmentSpeakingState extends State<FragmentSpeaking> with AutomaticKeepAliveClientMixin<FragmentSpeaking>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentSpeaking>(
        isActiveLoadingIndicator: true,
        model: ViewModelFragmentSpeaking(systemPadding(context).top),
        builder: (context, viewModel) => Scaffold(
              backgroundColor: R.color.viewBg,
              body: ScaffoldGradientBackground(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      R.color.gray.shade300,
                      R.color.gray.shade400,
                    ],
                  ),
                  appBar: _getAppBar(
                    context,
                    viewModel,
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // virtual assistant picture
                        ZoomIn(
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: R.color.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                height: 123,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // chat bubble
                        FadeInRight(
                          child: Visibility(
                            visible: generatedImageUrl == null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                                top: 30,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: R.color.primary,
                                ),
                                borderRadius: BorderRadius.circular(20).copyWith(
                                  topLeft: Radius.zero,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  generatedContent == null ? 'Good Morning, what task can I do for you?' : generatedContent!,
                                  style: TextStyle(
                                    fontFamily: 'Cera Pro',
                                    color: R.color.primary,
                                    fontSize: generatedContent == null ? 25 : 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (generatedImageUrl != null)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(generatedImageUrl!),
                            ),
                          ),
                        SlideInLeft(
                          child: Visibility(
                            visible: generatedContent == null && generatedImageUrl == null,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 10, left: 22),
                              child: Text(
                                'Here are a few features',
                                style: TextStyle(
                                  fontFamily: 'Cera Pro',
                                  color: R.color.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // features list
                        Visibility(
                          visible: generatedContent == null && generatedImageUrl == null,
                          child: Column(
                            children: [
                              SlideInLeft(
                                delay: Duration(milliseconds: start),
                                child: FeatureBox(
                                  color: R.color.primary,
                                  headerText: 'ChatGPT',
                                  descriptionText: 'A smarter way to stay organized and informed with ChatGPT',
                                ),
                              ),
                              SlideInLeft(
                                delay: Duration(milliseconds: start + delay),
                                child: FeatureBox(
                                  color: R.color.primary.shade500,
                                  headerText: 'Dall-E',
                                  descriptionText: 'Get inspired and stay creative with your personal assistant powered by Dall-E',
                                ),
                              ),
                              SlideInLeft(
                                delay: Duration(milliseconds: start + 2 * delay),
                                child: FeatureBox(
                                  color: R.color.primary,
                                  headerText: 'Smart Voice Assistant',
                                  descriptionText: 'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: ZoomIn(
                    delay: Duration(milliseconds: start + 3 * delay),
                    child: FloatingActionButton(
                      backgroundColor: R.color.primary,
                      onPressed: () async {
                        if (await speechToText.hasPermission && speechToText.isNotListening) {
                          await startListening();
                        } else if (speechToText.isListening) {
                          final speech = await viewModel.getGPTResult("what is mtls");
                          if (speech.contains('https')) {
                            generatedImageUrl = speech;
                            generatedContent = null;
                            setState(() {});
                          } else {
                            generatedImageUrl = null;
                            generatedContent = speech;
                            setState(() {});
                            await systemSpeak(speech);
                          }
                          await stopListening();
                        } else {
                          initSpeechToText();
                        }
                      },
                      child: Icon(
                        speechToText.isListening ? Icons.stop : Icons.mic,
                      ),
                    ),
                  )),
            ));
  }

  AppBarBasic _getAppBar(BuildContext context, ViewModelFragmentSpeaking viewModel) {
    return AppBarBasic(
      bgColor: R.color.gray.shade700,
      leading: SvgPicture.asset(
        R.drawable.svg.logo,
        height: 20.0,
      ),
      bottomBorderColor: R.color.primary,
    );
  }

  List<Widget> headerSliverBuilder(BuildContext context, ViewModelFragmentSpeaking viewModel) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverSafeArea(
          top: false,
          sliver: SliverAppBar(
            expandedHeight: systemPadding(context).top + 40.0,
            floating: false,
            pinned: true,
            backgroundColor: R.color.viewBg,
            elevation: 0.0,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              background: Container(color: R.color.viewBg),
              titlePadding: const EdgeInsets.symmetric(vertical: 4.0),
              title: Container(
                width: size(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextBasic(
                  text: R.string.expenses,
                  color: R.color.gray.shade900,
                  fontFamily: R.fonts.interSemiBold,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              width: size(context).width,
              color: R.color.viewBg,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextBasic(
                text: R.string.expenseDesc,
                color: R.color.gray.shade600,
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              width: size(context).width,
              color: R.color.viewBg,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0, bottom: 24.0),
              child: ButtonBasic(
                onPressed: () async {},
                text: '+ ${R.string.newForm}',
                fontFamily: R.fonts.interSemiBold,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: R.color.viewBg,
            child: TabBarBasic(
              tabs: viewModel.tabs,
            ),
          ),
        ),
      ),
    ];
  }
}
