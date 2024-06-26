import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GanttChart extends StatelessWidget {
  final List tasks; // list of task and its specficiations
  final List<DateTime> dates; // list of days to display on top
  DateTime startDate;
  DateTime endDate;
  GanttChart(
      {super.key,
      required this.tasks,
      required this.dates,
      required this.startDate,
      required this.endDate});

  String getDayOfTheWeek(DateTime date) {
    if (date.weekday == 1) {
      return "Mon";
    } else if (date.weekday == 2) {
      return "Tue";
    } else if (date.weekday == 3) {
      return "Wed";
    } else if (date.weekday == 4) {
      return "Thu";
    } else if (date.weekday == 5) {
      return "Fri";
    } else if (date.weekday == 6) {
      return "Sat";
    } else if (date.weekday == 7) {
      return "Sun";
    }
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    print("gantttt");
    print(startDate);
    print(endDate);
    return tasks.isEmpty
        ? Center(
            child: Text(
              "No tasks pending\n Click Add to create a task",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 300,
              width: (dates.length * 50) + 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                          dates.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        getDayOfTheWeek(dates[index]),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                      Text(
                                        dates[index].day.toString(),
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: tasks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          int barWidth = DateTime.parse(tasks[index]['endDate'])
                                  .difference(DateTime.parse(
                                      tasks[index]['currentDate']))
                                  .inDays
                                  .abs() +
                              1;
                          int paddingSize = startDate
                              .difference(
                                  DateTime.parse(tasks[index]['currentDate']))
                              .inDays
                              .abs();
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: paddingSize * 50,
                                ),
                                Container(
                                  width: barWidth * 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      tasks[index]['taskName'],
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
