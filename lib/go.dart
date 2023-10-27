// class Panel {
//   double length;
//   double width;
//
//   Panel(this.length, this.width);
// }
//
// class Sheet {
//   double length;
//   double width;
//   Sheet(this.length, this.width);
// }
//
// class Cut {
//   int order;
//   String panel;
//   String cut;
//   String result;
//
//   Cut(this.order, this.panel, this.cut, this.result);
// }
//
// class Optimizer {
//   List<Panel> panels;
//   List<Sheet> sheets;
//   List<Cut> cuts;
//
//   Optimizer(this.panels, this.sheets, this.cuts);
//
//   void optimize() {
//     // Sort panels by area from largest to smallest.
//     panels.sort((a, b) => (b.length * b.width).compareTo(a.length * a.width));
//
//     for (var panel in panels) {
//       bool placed = false;
//
//       // Try to place the panel in each sheet.
//       for (var sheet in sheets) {
//         if (panel.length <= sheet.length && panel.width <= sheet.width) {
//           // The panel fits in this sheet. Make a cut.
//           cuts.add(Cut(cuts.length + 1, '${panel.length}x${panel.width}', 'X=${panel.length}', '${sheet.length}x${sheet.width}'));
//
//           // Update the sheet size.
//           sheet.length -= panel.length;
//           if(sheet.width < panel.width) {
//             sheet.width = 0;
//           } else {
//             sheet.width -= panel.width;
//           }
//
//           placed = true;
//           break;
//         }
//       }
//
//       // If the panel didn't fit in any sheet, use a new sheet.
//       if (!placed) {
//         sheets.add(Sheet(15, 20)); // Use original sheet dimensions
//         cuts.add(Cut(cuts.length + 1, '${panel.length}x${panel.width}', 'X=${panel.length}', '${panel.length}x${panel.width}'));
//       }
//     }
//   }
//
//   void printStats() {
//     double totalUsedArea = 0;
//     double totalWastedArea = 0;
//     int totalCuts = cuts.length;
//     double totalCutLength = 0;
//
//     // Calculate total used area and total cut length.
//     for (var cut in cuts) {
//       var dimensions = cut.panel.split('x');
//       double length = double.parse(dimensions[0]);
//       double width = double.parse(dimensions[1]);
//       totalUsedArea += length * width;
//       totalCutLength += length + width;
//     }
//
//     // Calculate total wasted area.
//     for (var sheet in sheets) {
//       totalWastedArea += sheet.length * sheet.width;
//     }
//     totalWastedArea -= totalUsedArea;
//
//     // Calculate usage percentage.
//     double usagePercentage = (totalUsedArea / (totalUsedArea + totalWastedArea)) * 100;
//     double wastePercentage = 100 - usagePercentage;
//
//     print('Global statistics');
//     print('Used stock sheets: ${sheets.length} sheets');
//     print('Total used area: $totalUsedArea ($usagePercentage%)');
//     print('Total wasted area: $totalWastedArea ($wastePercentage%)');
//     print('Total cuts: $totalCuts');
//     print('Total cut length: $totalCutLength');
//   }
//
//   void printCuts() {
//     print('Cuts list and order');
//     print('order\tpanel\tcut\tresult');
//     for (var cut in cuts) {
//       print('${cut.order}.\t${cut.panel}\t${cut.cut}\t${cut.result}');
//     }
//   }
// }
//
// void main() {
//   List<Panel> panels = [];
//   List<double> panelLengthArr = [2, 4, 6];
//   List<double> panelWidthArr = [3, 5, 7];
//
//   print("**************** // Start Debug // *********************");
//   for (int i = 0; i < panelLengthArr.length; i++) {
//     panels.add(Panel(panelLengthArr[i], panelWidthArr[i]));
//     print("${panelLengthArr[i]}, ${panelWidthArr[i]}");
//   }
//   print("**************** // End Debug // *********************");
//   //
//   // List<Panel> panels = [
//   //   Panel(2, 3),
//   //   Panel(4, 5),
//   //   Panel(6, 7),
//   // ];
//
//   List<Sheet> sheets = [
//     Sheet(40, 40),
//   ];
//
//   List<Cut> cuts = [];
//
//   Optimizer optimizer = Optimizer(panels, sheets, cuts);
//   optimizer.optimize();
//   optimizer.printStats();
//   optimizer.printCuts();
// }
