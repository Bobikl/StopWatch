import QtQuick 2.0
import QtQml 2.0
import QtQuick.Layouts 1.0


Item {
    id: control
    signal pressed (int buttonNumber)
    RowLayout {
        anchors.fill: parent
        spacing: 40

        Item {
            Layout.fillWidth: true

        }

        Rectangle {
            id: buttonstart
            width: 70
            height: 55
            radius: 5
            border.width: 2
            color: "lightgrey"
            Text {
                id: text
                anchors.centerIn: parent
                text: "开始"
            }
            MouseArea {
                id: startMouse
                anchors.fill: parent
                visible: true
                onClicked: {
                    control.pressed(1)
                    text.text = "暂停"
                    stopMouse.visible = true
                    startMouse.visible = false
                    clearMouse.visible = false
                    serailMouse.visible = true
                    text1.text = "标记"

                }
            }
            MouseArea {
                id: stopMouse
                anchors.fill: parent
                visible: false
                onClicked: {
                    control.pressed(2)
                    text.text = "开始"
                    startMouse.visible = true
                    stopMouse.visible = false
                    clearMouse.visible = true
                    serailMouse.visible = false
                    text1.text = "清除"
                }
            }
        }

        Rectangle {
            id: buttonSign
            visible: true
            width: 70
            height: 55
            radius: 5
            border.width: 2
            color: "lightgrey"
            Text {
                id: text1
                anchors.centerIn: parent
                text: "清除"
            }
            MouseArea {
                id: clearMouse
                visible: true
                anchors.fill: parent
                onClicked: {
                    control.pressed(4)
                }
            }

            MouseArea {
                id: serailMouse
                visible: false
                anchors.fill: parent
                onClicked: {
                    control.pressed(3)
                }
            }
        }

        Item {
            Layout.fillWidth: true

        }
    }
}
