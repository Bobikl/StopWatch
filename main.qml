import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Window {
    id: window
    width: 300
    height: 400
    minimumHeight: 400
    minimumWidth: 300
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        TimeInterFace {
            id: timeInterFace
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        TimeButton {
            id: timeButton
            Layout.fillWidth: true
            height: 120
            onPressed: timeInterFace.startAndStop(buttonNumber)
        }
    }
}

