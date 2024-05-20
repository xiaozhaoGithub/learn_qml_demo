import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

FocusScope {
    property alias text: textInput.text
    property alias textInput: textInput

    width: 120
    height: textInput.height

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(32 / 255, 32 / 255, 34 / 255)
        border.color: Qt.rgba(60 / 255, 60 / 255, 60 / 255)
//        border.color: Qt.rgba(0 / 255, 186 / 255, 218 / 255)
    //    border.color: {
    //        Control.
    //    }
    }

    TextInput {
        id: textInput
        height: 32
        anchors.fill: parent
        anchors.margins: 4
        focus: true
        color: Qt.rgba(1, 1, 1, 0.80)
    }
}



