import 'package:flutter/material.dart';
import 'add_medication_screen.dart'; // 👈 새로 만들 '약 추가 화면'을 불러옵니다.

class MyMedicationScreen extends StatelessWidget {
  const MyMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 전체, 처방약, 영양제 3개의 탭
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        
        // 1. 상단 앱바 & 탭바
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('마이약장', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          // 🛑 [수정됨] 오른쪽 위 + 아이콘을 지웠습니다!
          bottom: const TabBar(
            labelColor: Color(0xFF2A8DE5),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF2A8DE5),
            indicatorWeight: 3,
            tabs: [
              Tab(text: '전체'),
              Tab(text: '처방약'),
              Tab(text: '영양제'),
            ],
          ),
        ),

        body: Column(
          children: [
            // 2. 검색창
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '약품명 또는 성분명 검색',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 3. 탭별 리스트 내용물
            Expanded(
              child: TabBarView(
                children: [
                  // [전체] 탭
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [
                      PillCard(icon: '💊', name: '아세트아미노펜 500mg', days: '5일분', instruction: '필요 시 복용', isWarning: false),
                      PillCard(icon: '🍘', name: '종합 비타민 (센트룸)', days: '20일분', instruction: '아침 식후 1정', isWarning: false),
                      PillCard(icon: 'Ω', name: '오메가3 (알티지)', days: '2일분', instruction: '저녁 식후 1캡슐', isWarning: true),
                    ],
                  ),
                  // [처방약] 탭
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [
                      PillCard(icon: '💊', name: '아세트아미노펜 500mg', days: '5일분', instruction: '필요 시 복용', isWarning: false),
                    ],
                  ),
                  // [영양제] 탭
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: const [
                      PillCard(icon: '🍘', name: '종합 비타민 (센트룸)', days: '20일분', instruction: '아침 식후 1정', isWarning: false),
                      PillCard(icon: 'Ω', name: '오메가3 (알티지)', days: '2일분', instruction: '저녁 식후 1캡슐', isWarning: true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        // ✨ 4. [새로 추가됨] 오른쪽 아래 둥둥 떠있는 파란색 + 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 버튼을 누르면 '약품 직접 추가' 새 화면으로 넘어갑니다!
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddMedicationScreen()),
            );
          },
          backgroundColor: const Color(0xFF2A8DE5),
          shape: const CircleBorder(),
          elevation: 4, // 살짝 그림자 추가
          child: const Icon(Icons.add, color: Colors.white, size: 35), // 아이콘 크기를 살짝 키웠습니다
        ),
      ),
    );
  }
}

// ==== [약 카드 부품 (삭제 기능 포함)] ====
class PillCard extends StatefulWidget {
  final String icon;
  final String name;
  final String days;
  final String instruction;
  final bool isWarning;

  const PillCard({super.key, required this.icon, required this.name, required this.days, required this.instruction, this.isWarning = false});

  @override
  State<PillCard> createState() => _PillCardState();
}

class _PillCardState extends State<PillCard> {
  bool _showDeleteMenu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: widget.isWarning ? const Border(left: BorderSide(color: Color(0xFFFF5252), width: 5)) : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFFFF8E1),
              child: Text(widget.icon, style: const TextStyle(fontSize: 20)),
            ),
            title: Row(
              children: [
                Expanded(child: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                if (widget.isWarning)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(10)),
                    child: const Text('소진 임박', style: TextStyle(color: Color(0xFFFF5252), fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            subtitle: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                children: [
                  const TextSpan(text: '남은 약: '),
                  TextSpan(text: widget.days, style: TextStyle(color: widget.isWarning ? const Color(0xFFFF5252) : Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: '  •  ${widget.instruction}', style: const TextStyle(color: Color(0xFF2A8DE5), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              onPressed: () {
                setState(() {
                  _showDeleteMenu = !_showDeleteMenu;
                });
              },
            ),
          ),
          if (_showDeleteMenu)
            Column(
              children: [
                const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('삭제', style: TextStyle(color: Color(0xFFFF5252), fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(width: 1, height: 20, color: const Color(0xFFEEEEEE)),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _showDeleteMenu = false;
                          });
                        },
                        child: const Text('취소', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}