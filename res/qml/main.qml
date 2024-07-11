import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15 as QQC2
import Qt.labs.settings 1.0

import common 1.0

//import "qrc:/res/js/qbubbles.js" as Game
QQC2.ApplicationWindow {
  id: appWnd

  // ----- Property Declarations
  // Required properties should be at the top.
  readonly property int screenOrientation: Qt.PortraitOrientation
  readonly property bool appInForeground: Qt.application.state === Qt.ApplicationActive

  // ----- Signal declarations

  // ----- Size information
  width: (screenOrientation === Qt.PortraitOrientation) ? 360 * DevicePixelRatio : 640
                                                          * DevicePixelRatio
  height: (screenOrientation === Qt.PortraitOrientation) ? 640 * DevicePixelRatio : 360
                                                           * DevicePixelRatio
  maximumHeight: height
  maximumWidth: width

  minimumHeight: height
  minimumWidth: width
  
  // ----- Then comes the other properties. There's no predefined order to these.
  visible: true
  visibility: (isMobile) ? Window.FullScreen : Window.Windowed
  flags: Qt.Dialog

  title: (isMobile) ? qsTr(" ") : Qt.application.name
  onAppInForegroundChanged: {
    AppSingleton.toLog(
          `appInForeground: [${appInForeground}] Qt.application.version ${Qt.application.version}`)
    if (appInForeground) {
    //paused
    } else {
    //played
    }
  }

  // ----- Signal handlers
  
  ColumnLayout {
    id: mainLayout
    anchors.fill: parent
    spacing: 2 * DevicePixelRatio
  }
}

