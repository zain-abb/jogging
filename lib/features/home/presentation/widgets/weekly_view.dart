import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../app/resource/assets.dart';

class WeeklyView extends ConsumerStatefulWidget {
  const WeeklyView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _WeeklyViewState();
}

class _WeeklyViewState extends ConsumerState<WeeklyView> {
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
                      Text('May 01 - May 07', style: textTheme.labelSmall),
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
                child: BarChart(
                  BarChartData(
                    maxY: 20,
                    gridData: FlGridData(show: false),
                    alignment: BarChartAlignment.spaceBetween,
                    backgroundColor: colorScheme.background,
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        bottom: BorderSide(
                          color: colorScheme.onInverseSurface,
                          width: 1,
                        ),
                      ),
                    ),
                    extraLinesData: ExtraLinesData(
                      extraLinesOnTop: true,
                      horizontalLines: [
                        HorizontalLine(
                          y: 10,
                          color: colorScheme.primary,
                          strokeWidth: 0.5,
                          dashArray: [6, 4],
                        ),
                      ],
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: getTitles,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    barTouchData: BarTouchData(
                      enabled: true,
                      allowTouchBarBackDraw: true,
                      handleBuiltInTouches: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: colorScheme.surfaceVariant,
                        tooltipMargin: dimens.p8,
                        direction: TooltipDirection.auto,
                        tooltipPadding: EdgeInsets.symmetric(
                          horizontal: dimens.p8,
                          vertical: dimens.p4,
                        ),
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            '${rod.toY.round().toString()} steps',
                            textTheme.labelSmall!
                                .copyWith(color: colorScheme.primary),
                            children: [
                              TextSpan(
                                  text: ' on ${group.x} ',
                                  style: textTheme.labelSmall)
                            ],
                          );
                        },
                      ),
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 8,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 10,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: 14,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            toY: 15,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(
                            toY: 13,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 5,
                        barRods: [
                          BarChartRodData(
                            toY: 10,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 6,
                        barRods: [
                          BarChartRodData(
                            toY: 16,
                            color: Theme.of(context).colorScheme.primary,
                            width: Assets.dimens.p32,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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

  Widget getTitles(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.labelSmall;
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
