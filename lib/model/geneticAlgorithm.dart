
import 'dart:math';

import 'greedyAlgorithm.dart';

// class Panel {
//   double length;
//   double width;
//
//   Panel(this.length, this.width);
// }
// class Sheet {
//   double length;
//   double width;
//
//   Sheet(this.length, this.width);
// }
// class Cut {
//   int order;
//   String panel;
//   String cut;
//   String result;
//
//   Cut(this.order, this.panel, this.cut, this.result);
// }
class Individual {
  List<Panel> panels;

  Individual(this.panels);

  double getFitness(List<Sheet> sheets) {
    double totalArea = 0;
    for (var panel in panels) {
      for (var sheet in sheets) {
        if (panel.length <= sheet.length && panel.width <= sheet.width) {
          totalArea += panel.length * panel.width;
          break;
        }
      }
    }
    return totalArea;
  }
}

class GeneticAlgorithm {
  List<Individual> population;
  List<Sheet> sheets;
  int generation;

  GeneticAlgorithm(this.population, this.sheets, this.generation);

  void initializePopulation(int populationSize, List<Panel> panels) {
    for (int i = 0; i < populationSize; i++) {
      population.add(Individual(List.from(panels)..shuffle()));
    }
  }

  void evolve() {
    List<Individual> newPopulation = [];
    for (int i = 0; i < population.length; i++) {
      Individual parent1 = selectParent();
      Individual parent2 = selectParent();
      Individual child = crossover(parent1, parent2);
      newPopulation.add(child);
    }
    population = newPopulation;
    generation++;
  }

  Individual selectParent() {
    Individual best = population[Random().nextInt(population.length)];
    for (int i = 0; i < 5; i++) {
      Individual contender = population[Random().nextInt(population.length)];
      if (contender.getFitness(sheets) > best.getFitness(sheets)) {
        best = contender;
      }
    }
    return best;
  }

  Individual crossover(Individual parent1, Individual parent2) {
    int crossoverPoint = Random().nextInt(parent1.panels.length);
    List<Panel> childPanels = parent1.panels.sublist(0, crossoverPoint)
      ..addAll(parent2.panels.sublist(crossoverPoint));
    return Individual(childPanels);
  }

  void printPopulation() {
    print('Generation: $generation');
    for (var individual in population) {
      print('Fitness: ${individual.getFitness(sheets)}');
    }
  }

  String printStats() {
    double totalUsedArea = population[0].getFitness(sheets);
    double totalWastedArea = sheets.length * sheets[0].length * sheets[0].width - totalUsedArea;
    double usagePercentage = (totalUsedArea / (totalUsedArea + totalWastedArea)) * 100;
    double wastePercentage = 100 - usagePercentage;

    String result = "Global statistics\n";
    result += "Used stock sheets: ${sheets.length} sheets\n";
    result += "Total used area: $totalUsedArea (${usagePercentage.round()}%)\n";
    result += "Total wasted area: $totalWastedArea (${wastePercentage.round()}%)\n";

    return result;
  }


  String printOrder() {
    String result = "Order list\n";
    result += "order\tpanel\n";
    for (int i = 0; i < population[0].panels.length; i++) {
      result += "${i + 1}.\t${population[0].panels[i].length}x${population[0].panels[i].width}\n";
    }
    return result;
  }

}

// void main() {
//   List<Panel> panels = [
//     Panel(20.0, 20.0),
//   ];
//
//   List<Sheet> sheets = [
//     Sheet(20.0, 20.0),
//   ];
//
//   List<Individual> population = [];
//
//   GeneticAlgorithm ga = GeneticAlgorithm(population, sheets, 0);
//   ga.initializePopulation(20, panels);
//   for (int i = 0; i < 100; i++) {
//     ga.evolve();
//   }
//   ga.printStats();
//   ga.printOrder();
// }
