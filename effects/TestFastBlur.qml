import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.5

Item {
    property bool isBlur: false
    property bool isInteger: false

    Row {
        spacing: 12

        Image {
            id: srcImage
            source: "qrc:/images/effects/tulips.jpg"
            sourceSize: Qt.size(200, 200)
            smooth: true
        }

        Column {
            FastBlur {
                width: 200
                height: width
                radius: slider.value
                source: srcImage

                Behavior on radius {
                    NumberAnimation {
                        duration: 1000
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isBlur = !isBlur
                    }
                }
            }

            Row {
                Text {
                    width: 35
                    id: radiusText
                    text: isInteger ? slider.value.toFixed(0) : slider.value.toFixed(1)
                    horizontalAlignment: Text.AlignRight
                    font.family: "Arial"
                    font.pixelSize: 11
                    color: "#B3B3B3"
                }
                Slider {
                    id: slider
                    orientation: Qt.Horizontal
                    from: 0.0
                    to: 64.0

                    ToolTip {
                        text: isInteger ? slider.value.toFixed(0) : slider.value.toFixed(1)
                        parent: slider.handle // 控制显示位置
                        visible: slider.pressed
                    }
                }
            }
        }
    }
}
