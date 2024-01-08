import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 20,
          unselectedFontSize: 16,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'未來計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'未來期望',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1=' 我是一位對電腦科技充滿熱情的年輕人，我深信透過對電腦工程的追求，我能夠在這個充滿挑戰與機會的領域中找到自己的定位。'
      '以下是我對成為一名電腦工程師的夢想和經歷的自傳。'
      '我的電腦工程師之路始於我對科技的好奇心。在我還是一名國中生時，我對電子產品的技術深感興趣。每當我使用電腦或手機時，我總是想了解它們是如何運作的，'
      '這推動我開始學習有關電腦科學和工程的知識。 大學我選擇了資工系作為我的專業。這不僅是因為我對技術的熱情，'
      '還因為我相信電腦工程是一個能夠改變世界的領域。透過程式設計和系統開發'
      '這個專案不僅挑戰了我的技術能力，還培養了我的團隊合作和問題解決能力。'
      '我的學術和實踐經歷塑造了我對電腦工程的獨特理解。我深信，電腦工程師不僅僅是技術的操控者，'
      '更是解決問題的創新者。這種信念推動著我不斷追求卓越，並時刻關注科技領域的最新發展。'
      '除了技術能力外，我也注重自己的軟實力'
      '成為一名電腦工程師對我而言不僅僅是一份職業，更是一種追求卓越和不斷學習的生活態度。'
      '我希望透過自己的努力和熱情，不斷挑戰自己，推動科技的進步，並為社會帶來實質的價值。謝謝您抽空閱讀'
      '我期待能有機會在未來的職業生涯中，為科技世界的發展貢獻一份力量';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  /*return Center(
      child: Container(child: Text('Screen2'),
      ),
    );*/
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LearningHistoryItem(
          icon: Icons.school,
          title: '學位取得',
          description: '畢業於中正高工資工系，因對資訊感興趣國中畢業決定進入高職就讀。',
        ),
        LearningHistoryItem(
          icon: Icons.code,
          title: '程式設計課程',
          description: '參與了於高中校內各項研習，初步學習各項程式能力基礎。',
        ),
        LearningHistoryItem(
          icon: Icons.language,
          title: '外語學習',
          description: '積極學習英文，為學習程式語言與大世界做準備，參加國內多益考試取得400分期望未來能增加。',
        ),
        // 可以根據需要添加更多的學習歷程項目
      ],
    );
  }
}
class LearningHistoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  LearningHistoryItem({required this.icon, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0, color: Colors.black),
        title: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
class screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/f2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期',style: TextStyle(fontSize: 35,color: Colors.amber)),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width:3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.amberAccent),
                ],
              ),
              height:120,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文' ,style: TextStyle(fontSize: 20)),
                  Text('2. 組合語言',style: TextStyle(fontSize: 20)),
                  Text('3. 考取證照',style: TextStyle(fontSize: 20)),
                  Text('4. 人際關係',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期',style: TextStyle(fontSize: 35,color: Colors.amber)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width:3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.amberAccent),
                ],
              ),
              height:120,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 考多益' ,style: TextStyle(fontSize: 20)),
                  Text('2. 精進程式語言',style: TextStyle(fontSize: 20)),
                  Text('3. 考取證照',style: TextStyle(fontSize: 20)),
                  Text('4. 擴大人際',style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期',style: TextStyle(fontSize: 35,color: Colors.amber)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width:3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.amberAccent),
                ],
              ),
              height:120,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學習其他語言' ,style: TextStyle(fontSize: 20)),
                  Text('2. 學習不同程式語言',style: TextStyle(fontSize: 20)),
                  Text('3. 考更高的多益分數',style: TextStyle(fontSize: 20)),
                  Text('4. 交女友',style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大四時期',style: TextStyle(fontSize: 35,color: Colors.amber)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width:3),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.amberAccent),
                  ],
                ),
                height:120,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 持續精進自我' ,style: TextStyle(fontSize: 20)),
                    Text('2. 參加實習與講座' ,style: TextStyle(fontSize: 20)),
                    Text('3. 面試準備畢業' ,style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height:150,
              decoration: BoxDecoration(
                border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage('images/f3.jpg'), fit: BoxFit.cover),
              ),
              //color: Colors.white,
            ),
            Container(
              width: 150,
              height:150,
              decoration: BoxDecoration(
                border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage('images/f4.jpg'), fit: BoxFit.cover),
              ),
              //color: Colors.white,
            ),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Text('網路工程師              ' ,style: TextStyle(fontSize: 22)),
                    Text('大數據分析' ,style: TextStyle(fontSize: 22)),
            ],
          ),
          SizedBox(width: 20,height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f5.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f6.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('    資安工程師         ' ,style: TextStyle(fontSize: 22)),
              Text('雲端網路設計' ,style: TextStyle(fontSize: 22)),
            ],
          ),
          SizedBox(width: 20,height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f7.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f8.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('    系統架構師         ' ,style: TextStyle(fontSize: 22)),
              Text('資訊工程教師' ,style: TextStyle(fontSize: 22)),
            ],
          ),
        ],
      ),
    );
  }
}