import 'package:flutter/material.dart';
import 'package:timer_app/ui/shared/custom_flat_button.dart';

class TimerView extends StatefulWidget {
  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with TickerProviderStateMixin {
  late AnimationController _controller;
  Duration duration = Duration(seconds: 60);

  String get timerString {
    // Duration duration = _controller.duration! * _controller.value;   Cronometro
    Duration duration =
        _controller.duration! * (1 - _controller.value); //CounterDown
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}'; //Convertir segundos a hora reloj xx:xx
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: duration); //inicializando el controlador del timer
    //   _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Text(
                  timerString,
                  style: TextStyle(
                      fontSize: 140,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFF9500)),
                );
              }),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: 'Iniciar',
                onPressed: () => _controller.forward(),
                backgroundColor: Color(0XFF00A1F7),
              ),
              SizedBox(
                width: 12,
              ),
              CustomFlatButton(
                text: 'Parar',
                onPressed: () => _controller.stop(),
                backgroundColor: Color(0XFFFF9500),
              ),
              SizedBox(
                width: 12,
              ),
              CustomFlatButton(
                text: 'Reiniciar',
                onPressed: () {
                  _controller.duration = duration;
                  _controller.reset();
                },
                backgroundColor: Color(0XFF59B87E),
              ),
            ],
          )
        ],
      ),
    );
  }
}
