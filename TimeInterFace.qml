import QtQuick 2.0
import QtQml 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Item {
    id: control
    property int numberPixelSize: window.width / 8
    property double timeColock
    property double timeColock1
    property double timeColock2
    property int serialNumber

    Timer {
        id: time
        interval: 16
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            timeColock += 1;
            addTime(timeColock)
            if (timeColock < 10){
                timeText.text = '0' + timeColock
            }
            else {
                timeText.text = timeColock
            }

            if (timeColock % 60 === 0){
                time.restart()
                timeColock = '00'
            }

            if (timeColock1 % 60 === 0){
                timeColock1 = '00'
            }

            if (timeColock2 % 60 === 0){
                timeColock2 = '00'
            }
        }
    }

    ColumnLayout {
        spacing: 5
        anchors.fill: parent

        ListView {
            id: listView
            model: ListModel {id: historyModel}
            Layout.fillHeight: true
            Layout.fillWidth: true
            ScrollBar.vertical: ScrollBar {}
            clip: true

            onCountChanged: {
                listView.currentIndex = count - 1
            }

            delegate: Item {
                height: label.implicitHeight
                width: parent ? parent.width : undefined

                property var object: historyModel.get(index)

                Label {
                    id: label
                    anchors.centerIn: parent
                    text: object ? object.text : ""
                    font.pixelSize: 45
                    color: "black"
                }
            }
        }

        RowLayout {
            id: gridLayout
            spacing: 20
            Item {
                Layout.fillWidth: true
            }

            Text {
                id: timeText2
                font.pixelSize: numberPixelSize
                text: "00"
            }

            Text {
                text: ":"
                font.pixelSize: numberPixelSize
            }

            Text {
                id: timeText1
                font.pixelSize: numberPixelSize
                text: "00"
            }
            Text {
                text: ":"
                font.pixelSize: numberPixelSize
            }

            Text {
                id: timeText
                font.pixelSize: numberPixelSize
                text: "00"
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    function addTime(timeColock){
        if (timeColock % 60 === 0){
            timeColock1 += 1
            if (timeColock1 < 10){
                timeText1.text = "0" + timeColock1
            }
            else{
                timeText1.text = timeColock1
            }
            addTime1(timeColock1)
        }
    }

    function addTime1(timeColock1){
        if (timeColock1% 60 === 0){
            timeColock2 += 1
            if (timeColock2 < 10){
                timeText2.text = "0" + timeColock2
            }
            else{
                timeText2.text = timeColock2
            }
        }
    }

    function startAndStop(buttonNumber){
        if (buttonNumber === 1){
            time.start()
        }
        else if (buttonNumber === 2){
            time.stop()

        } else if (buttonNumber === 3){
            var res = timeText2.text + ":" + timeText1.text + ":" + timeText.text
            historyModel.append({"text": res})
            console.log(res)
        } else if (buttonNumber === 4){
            historyModel.clear()
            timeText.text = "00"
            timeText1.text = "00"
            timeText2.text = "00"
            timeColock = 0
            timeColock1 = 0
            timeColock2 = 0
        }
    }
}
