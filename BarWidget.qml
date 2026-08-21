import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui
import "Model.js" as Model

// Stardate label for the bar: a Star Trek-style clock computed from the
// current date. A stardate barely moves minute to minute, so it refreshes
// once per hour rather than ticking with the system clock.
//
// Stardate = (Year - 2323) * 1000 + (DayOfYear / DaysInYear) * 1000
BarWidget {
  id: root
  moduleName: "iserrano.stardate"

  property date displayDate: new Date()
  readonly property real stardateValue: Model.stardateForDate(displayDate)
  readonly property string displayText: "Stardate " + Model.formatStardate(stardateValue)
  readonly property string tooltipDetail: "Stardate " + stardateValue.toFixed(3)
    + "\n" + Qt.formatDate(displayDate, "yyyy-MM-dd")
    + " · Day " + Model.dayOfYear(displayDate.getFullYear(), displayDate.getMonth(), displayDate.getDate())
    + "/" + Model.daysInYear(displayDate.getFullYear())

  function refresh() {
    displayDate = new Date()
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  IpcHandler {
    target: "iserrano.stardate"
    function refresh(): void { root.broadcast("refresh") }
  }

  Timer {
    interval: 3600000 // 1 hour
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.refresh()
  }

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.displayText
    tooltipText: root.tooltipDetail
    horizontalMargin: 8.75
    verticalPadding: 8.75
    onPressed: root.refresh()
  }
}
