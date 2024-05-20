import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Item {
    id: root
    width: 200
    height: 100

    Component {
        id: component1


        Image {
            id: target
            source: "images/homepage.png"

            focus: true // note

            Keys.onLeftPressed: target.x -= 8
            Keys.onRightPressed: target.x += 8
            Keys.onUpPressed: target.y -= 8
            Keys.onDownPressed: target.y += 8
            Keys.onSpacePressed: animation.start();
            Keys.onPressed: {
                switch(event.key) {
                case Qt.Key_Plus:
                    target.scale += 0.2
                    break;
                case Qt.Key_Minus:
                    target.scale -= 0.2
                    break;
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent // 填充
                onClicked: {
                    target.forceActiveFocus();
                }
            }

            NumberAnimation on x {
                to: root.width
                duration: 2000
            }
            Behavior on x {
                NumberAnimation {
                    duration: 500
                }
            }

            NumberAnimation {
                id: animation
                target: target
                property: "y"
                from: 0
                to: 200
                duration: 2000
            }
        }

    }

//    Loader {
//        sourceComponent: component1;
//        focus: true // note
//    }
    RowLayout {
        Loader {
            sourceComponent: component1;
            focus: true // note
        }
        Loader {
            sourceComponent: component1;
            focus: true // note
        }
    }
}
