import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Color?> _animation;
  var opacity = 0.3;
  var height = 40.0;
  var color = Colors.yellow;
  var rightPosition = 0.0;

  late Animation<double> _animationFade;
  late Animation<double> _animationScale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _animation = ColorTween(begin: Colors.red, end: Colors.green)
                  .animate(_controller)
                  ..addListener(() => setState(() {}));

    _animationFade = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animationScale = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);

    _controller.repeat(reverse: true);

    
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Lottie.network(
            'https://lottie.host/7f46313f-53a0-4115-8d59-9d38bfa6ccf6/strmquS8n4.json',
            width: 200,
            height: 200
          ),
          Lottie.network('https://lottie.host/0d177382-c549-408f-98d0-cbf70b4ea69c/O0D8AlirnQ.json'),
          Lottie.asset('assets/animasi.json'),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: 300,
                height: 100,
                color: _animation.value,
                child: child,
              );
            },
            child: const Center(child: Text("Animasi")),
          ),
          FadeTransition(
            opacity: _animationFade,
            child: Container(
              width: 300,
              height: 100,
              color: _animation.value,
              child: const Center(child: Text("Animasi")),
            ),
          ),
          Container(
            width: 300,
            height: 100,
            color: _animation.value,
            child: const Center(child: Text("Animasi")),
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    height += 20;
                    rightPosition += 10;
                    if(opacity >= 0.9) {
                      opacity = 0.3;
                    } else {
                      opacity += 0.1;
                    }
                    if(color == Colors.yellow) {
                      color = Colors.red;
                    } else {
                      color = Colors.yellow;
                    }
                  });
                },
                child: AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 300,
                    height: height,
                    color: color,
                    child: const Center(
                      child: Text("Animasi 2"),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                right: rightPosition,
                bottom: rightPosition,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: height/2,
                  width: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SecondScreen()
              ));
            },
            child: Hero(
              tag: 'logo',
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(24),
                child: ScaleTransition(
                  scale: _animationScale,
                  child: const FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(24),
            child: const FlutterLogo(
              size: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}