import QtQuick 2.0

// ClickableImage.qml


Image {
    id: root
    signal clicked
    property alias text: text.text

    Text {
        id: text
        text: qsTr("text")
        horizontalAlignment: Text.AlignRight
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
