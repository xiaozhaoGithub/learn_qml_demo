import QtQuick 2.0

Rectangle {
    property alias text: text.text

    width: 50
    height: 50
    color: "blue"

    Text {
        id: text
        text: qsTr("text")
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
