import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    width: 200
    height: 180
    color: Qt.rgba(11 / 255, 11 / 255, 12 / 255)

    ColumnLayout {
        spacing: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        MyTextInput {
            id: input1
            text: "Text Input 1"
            KeyNavigation.tab: input2
        }

        MyTextInput {
            id: input2
            text: "Text Input 2"
            KeyNavigation.tab: input1
        }
    }
}
