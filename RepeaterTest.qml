import QtQuick 2.0

Item {
    width: 600
    height: 400
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Row {
        spacing: 4
        Repeater {
    //        model: 8
            model: ["one", "two", "three", "four", "five"]
            delegate: MyButton {
                text: modelData + " " + "btn:" + index
                onTestEmit: {
                    console.log("btn emit")
                }
            }
        }
    }
}
