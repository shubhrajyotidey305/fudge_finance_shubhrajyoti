import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 600),
      tween: Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)),
      builder: (context, offset, child) {
        return FractionalTranslation(
          translation: offset,
          child: child,
        );
      },
      child: AspectRatio(
        aspectRatio: 1.70,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
            bottom: 20,
          ),
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xFF7C828A), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      fitInside: const SideTitleFitInsideData(
          distanceFromEdge: 0,
          enabled: true,
          axisPosition: -25,
          parentAxisSize: 0),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xFF7C828A), fontSize: 10);
    return Text(meta.formattedValue, style: style);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              const FlLine(
                color: Colors.transparent,
              ),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 5,
                  color: const Color(0xFF147AD6),
                  strokeWidth: 0,
                ),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (spots) {
            return spots
                .map(
                  (spot) => LineTooltipItem(
                    spot.y.toString(),
                    const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                        text: '  additional text',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
                .toList();
          },
        ),
      ),
      gridData: const FlGridData(
        show: false,
      ),
      minX: 0,
      minY: 0,
      maxX: 5,
      maxY: 500,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 250,
            getTitlesWidget: leftTitleWidgets,
            // reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 270),
            FlSpot(1, 250),
            FlSpot(2, 300),
            FlSpot(3, 450),
            FlSpot(4, 210),
            FlSpot(5, 150),
          ],
          isCurved: true,
          barWidth: 1,
          isStrokeCapRound: true,
          preventCurveOverShooting: true,
          color: const Color(0xFF147AD6),
          dotData: FlDotData(
            show: false,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 3,
              strokeWidth: 0,
              color: const Color(0xFF147AD6),
            ),
            checkToShowDot: (spot, _) => spot.y == 300,
          ),
          belowBarData: BarAreaData(
            show: true,
            spotsLine: const BarAreaSpotsLine(
              show: true,
              flLineStyle: FlLine(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF147AD6).withOpacity(0.2),
                const Color(0xFF147AD6).withOpacity(0.1),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
          aboveBarData: BarAreaData(
            show: true,
            spotsLine: const BarAreaSpotsLine(
              show: true,
              flLineStyle: FlLine(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF147AD6).withOpacity(0.2),
                const Color(0xFF147AD6).withOpacity(0.1),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
