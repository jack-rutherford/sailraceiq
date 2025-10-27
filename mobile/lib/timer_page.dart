import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';
// import 'dart:async';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _initialTimeInSeconds = 0;
  int _remainingTimeInSeconds = 0;
  bool _isRunning = false;
  late PausableTimer timer;
  
  void _startTimer() {
    if (_isRunning || _initialTimeInSeconds == 0) return;

    setState(() {
      if (_remainingTimeInSeconds == 0) {
        _remainingTimeInSeconds = _initialTimeInSeconds;
      }
      _isRunning = true;
    });

    timer = PausableTimer(Duration(seconds: 1), () {
      if (_remainingTimeInSeconds <= 0) {
        timer.cancel();
        setState(() => _isRunning = false);
        return;
      }

      _playBeep(_remainingTimeInSeconds);

      setState(() {
        _remainingTimeInSeconds--;
      });

      timer.start();
    });

    timer.start();
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      _isRunning = false;
      _remainingTimeInSeconds = _initialTimeInSeconds;
    });
  }

  void _pauseTimer() {
    timer.pause();
    setState(() {
      _isRunning = false;
    });
  }
  
  void _playBeep(int secondsLeft) {
    // Placeholder: Replace this with actual beep logic using a sound package
    if (secondsLeft % 60 == 0 && secondsLeft > 60) {
      print("Beep: Minute");
    } else if (secondsLeft <= 60 && secondsLeft > 15 && secondsLeft % 10 == 0) {
      print("Beep: Every 10s");
    } else if (secondsLeft <= 15 && secondsLeft > 10) {
      print("Beep: Every 1s");
    } else if (secondsLeft <= 10 && secondsLeft > 5) {
      print("Beep: 2x per second");
    } else if (secondsLeft <= 5) {
      print("Beep: 3x per second");
    }
  }
  
  void _incrementTime() {
    if (_isRunning) return;
    setState(() {
      _initialTimeInSeconds += 60;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${twoDigits(minutes)}:${twoDigits(remainingSeconds)}';
  }
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isPortrait
          ? AppBar(
              title: Text("TIMER",
                  style: Theme.of(context).textTheme.headlineLarge),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            )
          : null,
      body: GestureDetector(
        onTap: _incrementTime,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTime(_isRunning ? _remainingTimeInSeconds : _initialTimeInSeconds),
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: MediaQuery.of(context).size.height * 0.2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isRunning ? _stopTimer : _startTimer,
                    child: Text(_isRunning ? 'Stop' : 'Start'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isRunning ? _pauseTimer : null,
                    child: Text('Pause'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
