import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jogging/app/extensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../app/resource/assets.dart';

class MonthlyView extends ConsumerStatefulWidget {
  const MonthlyView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MonthlyViewState();
}

class _MonthlyViewState extends ConsumerState<MonthlyView> {
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
              AspectRatio(
                aspectRatio: 1 / 1,
                child: SfCalendar(
                  view: CalendarView.month,
                  firstDayOfWeek: 1,
                  todayHighlightColor: colorScheme.primary,
                  cellBorderColor: Colors.transparent,
                  backgroundColor: colorScheme.background,
                  initialDisplayDate: DateTime.now(),
                  headerStyle: CalendarHeaderStyle(
                    textStyle: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  showNavigationArrow: true,
                  allowViewNavigation: false,
                  monthCellBuilder: (context, details) {
                    return CircularPercentIndicator(
                      percent: details.date.isAfter(DateTime.now()) ? 0 : 0.75,
                      lineWidth: 4.0,
                      animation: true,
                      radius: dimens.p20,
                      progressColor: colorScheme.primary,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: colorScheme.onInverseSurface,
                      center: Text(
                        details.date.day.toString(),
                        style: details.date.isAtSameTimeAs(DateTime.now())
                            ? textTheme.labelMedium?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w900)
                            : textTheme.labelSmall,
                      ),
                    );
                  },
                  monthViewSettings: const MonthViewSettings(
                    showTrailingAndLeadingDates: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: dimens.p16),
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
}
