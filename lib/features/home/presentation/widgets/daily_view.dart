import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jogging/shared/presentation/utils/delay.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../app/resource/assets.dart';
import '../../../../shared/presentation/widgets/ui_helper.dart';
import '../../domain/entities/date_interval.dart';
import '../controller/home_controller.dart';

class DailyView extends ConsumerStatefulWidget {
  const DailyView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DailyViewState();
}

class _DailyViewState extends ConsumerState<DailyView> {
  @override
  void initState() {
    super.initState();

    delay(
        milliseconds: 200,
        operation: () {
          _fetchDailyData();
          // _fetchStepsInInterval();
        });
  }

  Future<void> _fetchDailyData() async {
    final controller = ref.read(homeControllerProvider.notifier);
    // get steps data points for today (i.e., since midnight)
    final to = DateTime.now();
    final from = DateTime(to.year, to.month, to.day);
    final params = DateInterval(from: from, to: to);
    await controller.fetchDailyData(params);
  }

  Future<void> _fetchStepsInInterval() async {
    final controller = ref.read(homeControllerProvider.notifier);
    // get steps for today (i.e., since midnight)
    final to = DateTime(2023, 5, 2);
    final from = DateTime(2023, 5, 1);
    final params = DateInterval(from: from, to: to);
    await controller.fetchStepsInInterval(params);
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Assets.dimens;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final homeControllerState = ref.watch(homeControllerProvider);
    final homeControllerNotifier = ref.watch(homeControllerProvider.notifier);

    if (homeControllerState.isLoading) {
      return Center(child: UiHelper.displayLoader());
    }

    return Padding(
      padding: EdgeInsets.all(dimens.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: set total time spent
          Text('Time', style: textTheme.titleMedium),
          dimens.gapH4,
          RichText(
            text: TextSpan(
              text: 'Total 4',
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              children: [
                TextSpan(text: ' hrs today', style: textTheme.labelSmall),
              ],
            ),
          ),
          dimens.gapH4,
          Text('12 am - now', style: textTheme.labelSmall),
          dimens.gapH32,
          // TODO: Total count of steps
          Align(
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              percent: 0.75,
              radius: 116.0,
              animation: true,
              lineWidth: dimens.p16,
              progressColor: colorScheme.primary,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: colorScheme.onInverseSurface,
              center: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.image.footStep,
                    width: dimens.p32,
                    height: dimens.p32,
                    colorFilter:
                        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
                  ),
                  dimens.gapH16,
                  Text(
                    homeControllerNotifier.stepsInInterval.toString(),
                    style: textTheme.displayMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  dimens.gapH12,
                  Text(
                    'Goal 8000 steps',
                    style: textTheme.labelSmall
                        ?.copyWith(color: colorScheme.inversePrimary),
                  ),
                ],
              ),
            ),
          ),
          dimens.gapH32,
          Text('Steps over today', style: textTheme.titleMedium),
          dimens.gapH12,
          // TODO: draw a chart for the steps over the day
          Expanded(
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
          dimens.gapH48
        ],
      ),
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
