class Panel {
  double length;
  double width;

  Panel(this.length, this.width);
}

class Sheet {
  double length;
  double width;

  Sheet(this.length, this.width);
}

class Cut {
  int order;
  String panel;
  String cut;
  String result;

  Cut(this.order, this.panel, this.cut, this.result);
}

class Optimizer {
  List<Panel> panels;
  List<Sheet> sheets;
  List<Cut> cuts;

  Optimizer(this.panels, this.sheets, this.cuts);

  void optimize() {
    // Sort panels by area from largest to smallest.
    panels.sort((a, b) => (b.length * b.width).compareTo(a.length * a.width));

    for (var panel in panels) {
      bool placed = false;

      // Try to place the panel in each sheet.
      for (var sheet in sheets) {
        if (panel.length <= sheet.length && panel.width <= sheet.width) {
          // The panel fits in this sheet. Make a cut.
          cuts.add(Cut(cuts.length + 1, '${panel.length}x${panel.width}', 'X=${panel.length}', '${sheet.length}x${sheet.width}'));

          // Update the sheet size.
          sheet.length -= panel.length;
          if (sheet.width < panel.width) {
            sheet.width = 0;
          } else {
            sheet.width -= panel.width;
          }

          placed = true;
          break;
        }
      }

      // If the panel didn't fit in any sheet, use a new sheet.
      if (!placed) {
        sheets.add(Sheet(15, 20)); // Use original sheet dimensions
        cuts.add(Cut(cuts.length + 1, '${panel.length}x${panel.width}', 'X=${panel.length}', '${panel.length}x${panel.width}'));
      }
    }
  }

  String printStats() {
    double totalUsedArea = 0;
    double totalWastedArea = 0;
    int totalCuts = cuts.length;
    double totalCutLength = 0;

    // Calculate total used area and total cut length.
    for (var cut in cuts) {
      var dimensions = cut.panel.split('x');
      double length = double.parse(dimensions[0]);
      double width = double.parse(dimensions[1]);
      totalUsedArea += length * width;
      totalCutLength += length + width;
    }

    // Calculate total wasted area.
    for (var sheet in sheets) {
      totalWastedArea += sheet.length * sheet.width;
    }
    totalWastedArea -= totalUsedArea;

    // Calculate usage percentage.
    double usagePercentage = (totalUsedArea / (totalUsedArea + totalWastedArea)) * 100;
    double wastePercentage = 100 - usagePercentage;

    String result = 'Global statistics\n';
    result += 'Used stock sheets: ${sheets.length} sheets\n';
    result += 'Total used area: $totalUsedArea (${usagePercentage.round()}%)\n';
    result += 'Total wasted area: $totalWastedArea (${wastePercentage.round()}%)\n';
    result += 'Total cuts: $totalCuts\n';
    result += 'Total cut length: $totalCutLength';

    return result;
  }

  void printCuts() {
    print('Cuts list and order');
    print('order\tpanel\tcut\tresult');
    for (var cut in cuts) {
      print('${cut.order}.\t${cut.panel}\t${cut.cut}\t${cut.result}');
    }
  }
}

// void main() {
//   List<Panel> panels = [
//     Panel(8.0, 9.0),
//     Panel(7.0, 8.0),
//   ];
//
//   List<Sheet> sheets = [
//     Sheet(30.0, 15.0),
//     Sheet(15.0, 15.0),
//   ];
//
//   List<Cut> cuts = [];
//
//   Optimizer optimizer = Optimizer(panels, sheets, cuts);
//   optimizer.optimize();
//   print(optimizer.printStats());
//   optimizer.printCuts();
// }
