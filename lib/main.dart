import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrackerHome(),
    );
  }
}


class TrackerHome extends StatefulWidget {
  //
  @override
  _TrackerHomeState createState() => _TrackerHomeState();
}


class _TrackerHomeState extends State<TrackerHome> {
  // to track selected bottom navigation index
  int selectedBottomIndex = -1;


  void onTopBarTap(String which) {
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$which tapped')));
  }


  void onCenterBoxTap(int index) {


    Widget screen;
    switch (index) {
      case 1:
        screen = ExpensesScreen();
        break;
      case 2:
        screen = ExerciseScreen();
        break;
      case 3:
        screen = ToDoListScreen();
        break;
      case 4:
        screen = HobbiesScreen();
        break;
      case 5:
        screen = CustomScreen();
        break;
      default:
        return; // No action for other indices
    }


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Box $index tapped')));
  }


  void onBottomNavTap(int index) {
    setState(() {
      selectedBottomIndex = index;
    });


    Widget screen;
    switch (index) {
      case 0:
        screen = ExpensesScreen();
        break;
      case 1:
        screen = ExerciseScreen();
        break;
      case 2:
        screen = CustomScreen();
        break;
      case 3:
        screen = ToDoListScreen();
        break;
      case 4:
        screen = HobbiesScreen();
        break;
      default:
        return; // No action for other indices
    }


      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bottom Nav $index tapped')));
  selectedBottomIndex = -1;
  }


  @override
  Widget build(BuildContext context) {
    // Center boxes data
    final List<Map<String, dynamic>> centerBoxes = [
      {'icon': Icons.account_balance_wallet, 'text': 'Expenses'},
      {'icon': Icons.fitness_center_sharp, 'text': 'Exercise'},
      {'icon': Icons.checklist_rtl, 'text': 'To-Do List'},
      {'icon': Icons.interests_rounded, 'text': 'Hoibbies'},
      {'icon': Icons.add_box, 'text': 'Custom'},
      // {'icon': Icons.access_alarm, 'text': 'Box 1'},
      // {'icon': Icons.account_balance, 'text': 'Box 2'},
      // {'icon': Icons.ad_units, 'text': 'Box 3'},
      // {'icon': Icons.airplanemode_active, 'text': 'Box 4'},
      // {'icon': Icons.anchor, 'text': 'Box 5'},
    ];


    // Bottom nav data
    final List<Map<String, dynamic>> bottomNav = [
      {'icon': Icons.account_balance_wallet, 'text': 'Expenses'},
      {'icon': Icons.fitness_center_sharp, 'text': 'Exercise'},
      {'icon': Icons.add_box, 'text': 'Custom'},
      {'icon': Icons.checklist_rtl, 'text': 'To-Do List'},
      {'icon': Icons.interests_rounded, 'text': 'Hoibbies'},
    ];


    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Custom Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Hamburger
                  GestureDetector(
                    onTap: () => onTopBarTap('Hamburger'),
                    child: Icon(Icons.menu, size: 28),
                  ),
                  // Centered "Tracker"
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () => onTopBarTap('Tracker'),
                        child: Text(
                         'Tracker',
                        style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.bold,
                           letterSpacing: 1.2,
                         ),
                       ),
                      ),
                    ),
                  ),
                  // Person icon in black rounded rectangle
                  GestureDetector(
                    onTap: () => onTopBarTap('Profile'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.person, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Center 5 boxes (2 per row, last centered)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCenterBox(centerBoxes[0], 0),
                      _buildCenterBox(centerBoxes[1], 1),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCenterBox(centerBoxes[2], 2),
                      _buildCenterBox(centerBoxes[3], 3),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Last box centered
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCenterBox(centerBoxes[4], 4),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, blurRadius: 6, offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(bottomNav.length, (index) {
                  final isSelected = selectedBottomIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onBottomNavTap(index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              bottomNav[index]['icon'],
                              color: isSelected ? Colors.blueAccent : Colors.grey,//remove isselected color change because it is not used
                            ),
                            SizedBox(height: 4),
                            Text(
                              bottomNav[index]['text'],
                              style: TextStyle(
                                color: isSelected ? Colors.blueAccent : Colors.grey, //remove isselected color change because it is not used
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, //remove isselected fontweight because it is not used
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCenterBox(Map<String, dynamic> data, int index) {
    // This widget builds each center box with an icon and text
    return GestureDetector(
      onTap: () => onCenterBoxTap(index + 1),
      child: Container(
        width: 180,
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, blurRadius: 8, offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(data['icon'], size: 32, color: Colors.blueAccent),
            SizedBox(height: 8),
            Text(
              data['text'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
class ExpensesScreen extends StatefulWidget {
  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}
//Expense screen (screen 2 )
class _ExpensesScreenState extends State<ExpensesScreen> {
  bool showYearGrid = false; // Flag to toggle between year and month grid
  int selectedYear = DateTime.now().year; // Current year
  String selectedMonth = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][DateTime.now().month-1]; // You can use a list of months for selection
  //String currentMonth = 'Jun'; // Default selected month
  // Function to handle year & month selection
  void onYearMonthLogic(){


  }
 
  //year and month selection dialog
  void showSelectDialog(BuildContext context) {//, String title, Widget content) {
    // Function to show a dialog with a title and content
 
  showDialog(
    context: context,
         builder: (context) => StatefulBuilder(
         builder: (context, setState) => AlertDialog(
      title: Text("Select Year and Month"),
      content: SizedBox(
        width: 300, // Set a fixed width for the dialog
        height: 168, // Set a fixed height for the dialog
      //child: SingleChildScrollView(
       child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                      setState(() {
                        showYearGrid = !showYearGrid; // Toggle between month and year grid
                        });
               }    ,
  child: Text('$selectedYear'),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      // Handle left arrow action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      // Handle right arrow action
                    },
                  ),
                ],
              ),
            ],
          ),
          //SizedBox(height: 16),
        //Text("Test Body"),
        // Month selection grid
        SizedBox(
  width: 260, // Adjust width as needed
  height: 120, // Adjust height as needed
 
 
  child: showYearGrid
              ? GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.6,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(12, (i) {
                    int year = DateTime.now().year - 5 + i;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedYear = year;
                          showYearGrid = false; // Switch back to month grid
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: year == selectedYear ? Colors.orange[300] : Colors.transparent,
                          border: year == DateTime.now().year
                              ? Border.all(color: Colors.orange, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$year',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: year == selectedYear ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                )
             
              : GridView.count(
    crossAxisCount: 4, // 4 columns
    childAspectRatio: 1.6, // Adjust for wider cells if needed
    //shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      'Jan', 'Feb', 'Mar', 'Apr',
      'May', 'Jun', 'Jul', 'Aug',
      'Sep', 'Oct', 'Nov', 'Dec'
    ].map((month) {
      final isSelected = month == selectedMonth;
      final isCurrent = month ==
        ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][DateTime.now().month - 1];
 
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedMonth = month;
          });
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange[300] : Colors.transparent,
            border: isCurrent
                ? Border.all(color: Colors.orange, width: 2)
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            month,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
  }).toList(),
  ),
),
        ],
      ),
      //),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text('Expenses Tracker'),
         automaticallyImplyLeading: false,
         actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings tap
            },
          ),
         ],
         //Info bar
        bottom: PreferredSize(
  preferredSize: Size.fromHeight(70), // Increase height for 2 rows
  child: Container(
    color: Colors.grey[300],
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First row: year, Expense, Income, Balance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       GestureDetector(
          onTap: () {
    showSelectDialog(
      context,
     
    );
  },
    child: Text('$selectedYear', style: TextStyle(color: Colors.grey[400], fontSize: 18)),
                ),
            Text('Expense', style: TextStyle(color: Colors.grey[400], fontSize: 18)),
            Text('Income', style: TextStyle(color: Colors.grey[400], fontSize: 18)),
            Text('Balance', style: TextStyle(color: Colors.grey[400], fontSize: 18)),
          ],
        ),
        SizedBox(height: 4),
        // Second row: month, 0, 0, 0
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
  onTap: () {
    showSelectDialog(
      context
    );
  },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               
            Text('Jun', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
               
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
                ),
              ],
            ),
            Text('0', textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('0', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('0', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  ),
),  
  ),


      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_sharp, size: 64, color: Colors.orangeAccent), // Top icon
            SizedBox(height: 16),
            Text('No Records', style: TextStyle( color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        ),  
    bottomNavigationBar: Stack(
      clipBehavior: Clip.none,
      children: [
      BottomNavigationBar(
      items: [


        BottomNavigationBarItem(icon: Icon(Icons.home, size: 32 ), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.description, size: 32), label: 'Records'),
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''), // Empty for center
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart, size: 32), label: 'Charts'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long, size: 32), label: 'Reports'),
      ],
      currentIndex: 0, // Set the current index to the first item
      onTap: (index) {
        // Handle bottom navigation tap
        switch(index) {
          case 0:
            Navigator.pop(context); // Go back to the previous screen
            break;
          case 1:
            break;
          case 2:// This is the center item, do nothing
            break;
          case 3:
            break;
          case 4:
            break;
          default:
            break;
        }
      },
      type: BottomNavigationBarType.fixed,  
      ),
          Positioned(
            top: -22, // Move up by half the icon size
            left: MediaQuery.of(context).size.width / 2 - 30, // Center horizontally
            child: GestureDetector(
              onTap: () {
                // Handle add tap
              },
          child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Icon(Icons.add, color: Colors.black, size: 42),
            ),
            ),
          ),




      ],
     ),
    );


  }
}




//Exercise screen (screen 3 )
class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercise Tracker')),
      body: Center(child: Text('Exercise Screen')),
    );
  }
}


//Custom screen (screen 4 )
class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Tracker')),
      body: Center(child: Text('Custom Screen')),
    );
  }
}


//ToDoList screen (screen 5 )
class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDoList Tracker')),
      body: Center(child: Text('ToDoList Screen')),
    );
  }
}


//Hobbies screen (screen 6 )
class HobbiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hobbies Tracker')),
      body: Center(child: Text('Hobbies Screen')),
    );
  }
}

    