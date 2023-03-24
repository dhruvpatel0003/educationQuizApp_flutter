import 'package:education_app/config/themes/custom_text.dart';
import 'package:education_app/controllers/question_paper/questions_controller.dart';
import 'package:education_app/screens/question/result_screen.dart';
import 'package:education_app/widgets/common/background_decoration.dart';
import 'package:education_app/widgets/common/custom_app_bar.dart';
import 'package:education_app/widgets/content_area.dart';
import 'package:education_app/widgets/questions/answer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);

  static const String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
              () =>
              Text(
                'Q. ${(controller.questionIndex.value + 1).toString()
                    .padLeft(2, '0')}',
                style: appBarTS,
              ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
            ()=>Column(
              children: [
                Expanded(child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top:20),
                    child:Column(
                      children: [
                        Text(
                          controller.currentQuestions.value!.question
                        ),
                        GetBuilder<QuestionsController>(id:'answer_review_list',builder: (_){
                                return ListView.separated(
                                  shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (_,index){
                                    final answer = controller.currentQuestions.value!.answers[index];
                                    final selectedAnswer = controller.currentQuestions.value!.selectedAnswer;
                                    final correctAnswer = controller.currentQuestions.value!.correctAnswer;
                                    final String answerText = '${answer.identifier}. ${answer.answer}';
                                    if(correctAnswer==selectedAnswer && answer.identifier==selectedAnswer){
                                      return CorrectAnswer(answer: answerText);
                                    }else if(selectedAnswer==null){
                                      return NotAnswered(answer: answerText);
                                    }else if(correctAnswer!=selectedAnswer && answer.identifier == selectedAnswer){//wrong answer
                                      WrongAnswer(answer: answerText,);
                                    }else if (correctAnswer==answer.identifier){//correct answer
                                      return CorrectAnswer(answer: answerText);
                                    }

                                    return AnswerCard(
                                        answer: answerText,
                                        onTap: (){

                                        },
                                    isSelected: false,);


                                    },
                                    separatorBuilder: (_,index){
                                    return const SizedBox(
                                      height: 10,
                                    );
                                    },
                                    itemCount: controller.currentQuestions.value!.answers.length);

                        })
                      ],
                    )
                  ),
                ))
              ],
            )
        ),
      ),
    );
  }
}