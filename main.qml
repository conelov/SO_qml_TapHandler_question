import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    color: tap.pressed ? "#6698D9" : "white"
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.preferredHeight: text.height
            Layout.fillWidth: true
            color: "transparent"
            border {
                color: "blue"
                width: 3
            }

            Text {
                id: text
                anchors.centerIn: parent
                font.pointSize: 24
                color: "red"
                text: "some text"
            }
        }

        ListView {
            id: seriesView
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: ListView.Vertical
            spacing: 5
            clip: true
            model: ["t1", "t2", "t3"]
            delegate: Rectangle {
                width: seriesView.width
                height: childText.height
                color: "transparent"
                border {
                    color: "blue"
                    width: 3
                }

                Text {
                    id: childText
                    anchors.centerIn: parent
                    font.pointSize: 24
                    color: "green"
                    text: modelData
                }
            }
        }
    }

    TapHandler {
        id: tap
        onTapped: console.log("Tapped root")
    }
}
