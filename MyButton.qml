import QtQuick 2.0

Rectangle {
    id: root
    // export button properties
    property alias text: label.text
    signal clicked
    signal testEmit

    width: 116;
    height: 26
    color: "lightsteelblue"
    border.color: "slategrey"

    Text {
        id: label
        anchors.centerIn: parent
        text: "Start"
    }
    MouseArea {
        anchors.fill: parent
        drag.target: root
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.maximumX: globalWindows.width - parent.width
        drag.minimumY: 0
        drag.maximumY: globalWindows.height - parent.height
        onClicked: {
            root.clicked()
            root.testEmit()
        }
    }
}
