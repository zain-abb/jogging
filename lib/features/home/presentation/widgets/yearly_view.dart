import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../app/resource/assets.dart';

class YearlyView extends ConsumerStatefulWidget {
  const YearlyView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _WeeklyViewState();
}

class _WeeklyViewState extends ConsumerState<YearlyView> {
  @override
  Widget build(BuildContext context) {
    final dimens = Assets.dimens;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: colorScheme.background,
          padding: EdgeInsets.all(dimens.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: set total time spent
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Avg', style: textTheme.titleMedium),
                      dimens.gapH4,
                      RichText(
                        text: TextSpan(
                          text: '5,673',
                          style: textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text: ' steps', style: textTheme.labelSmall),
                          ],
                        ),
                      ),
                      dimens.gapH4,
                      Text('2022 - 2023', style: textTheme.labelSmall),
                    ],
                  ),
                  CircularPercentIndicator(
                    percent: 0.75,
                    lineWidth: 3.0,
                    animation: true,
                    radius: dimens.p20,
                    progressColor: colorScheme.primary,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: colorScheme.onInverseSurface,
                    center: Icon(
                      Icons.watch_later_rounded,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    footer: Text(
                      '4.45 h',
                      style: textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              dimens.gapH32,
              AspectRatio(
                aspectRatio: 16 / 9,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      getDrawingVerticalLine: (_) => FlLine(
                        color: colorScheme.onInverseSurface,
                        strokeWidth: 0.2,
                      ),
                      getDrawingHorizontalLine: (_) => FlLine(
                        color: Colors.transparent,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: bottomTitleWidgets,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 5.5,
                    extraLinesData: ExtraLinesData(
                      extraLinesOnTop: true,
                      horizontalLines: [
                        HorizontalLine(
                          y: 3,
                          color: colorScheme.secondary,
                          strokeWidth: 0.15,
                          dashArray: [6, 4],
                          label: HorizontalLineLabel(
                            show: true,
                            style: textTheme.labelSmall
                                ?.copyWith(color: colorScheme.inversePrimary),
                            labelResolver: (line) => 'Avg',
                          ),
                        ),
                      ],
                    ),
                    lineTouchData: LineTouchData(
                      enabled: true,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: true,
                        preventCurveOverShooting: true,
                        gradient: LinearGradient(
                          colors: [colorScheme.primary, colorScheme.primary],
                        ),
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              colorScheme.primary,
                              colorScheme.background,
                            ].map((color) => color.withOpacity(0.15)).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 300),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(dimens.p16),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => ListTile(
              tileColor: colorScheme.onInverseSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text('1,080 steps', style: textTheme.titleMedium),
              subtitle: Text('Monday, $index May', style: textTheme.labelSmall),
              trailing: CircularPercentIndicator(
                percent: index / 7,
                lineWidth: 2.0,
                animation: true,
                radius: dimens.p16,
                progressColor: colorScheme.primary,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: colorScheme.background,
                center: Icon(
                  Icons.watch_later_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(
              thickness: 0.0,
              color: Colors.transparent,
            ),
            itemCount: 7,
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.labelSmall;
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('12 am', style: style);
        break;
      case 5:
        text = Text('6 am', style: style);
        break;
      case 8:
        text = Text('12 pm', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
