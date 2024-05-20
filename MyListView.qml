import QtQuick 2.5

Rectangle {
    width: 240
    height: 300

    color: "gray"

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: 20

        model: 100
        delegate: numberDelegate

        spacing: 5
        focus: true
        clip: true
        highlight: highlight
        boundsBehavior: Flickable.StopAtBounds
        highlightFollowsCurrentItem: false

        header: headerComponent
        footer: footerComponent
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: ListView.view.width
            height: 32
//            color: listView.currentIndex === index ? "lightblue" : "white"
            color: ListView.isCurrentItem? "lightblue" : "white"

            Text {
                id: text
                text: index
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index
                }
            }
        }
    }

    Component {
        id: highlight
        Rectangle {
            width: ListView.view.width
            height: 32
            color: "lightblue";
            radius: 5
            y: listView.currentItem.y
            Behavior on y {
                SpringAnimation {
                    spring: 3
                    damping: 0.2
                }
            }
        }
    }

    Component {
        id: headerComponent

        Rectangle {
            width: listView.width
            height: 32
            color: "yellow"

            Text {
                id: text
                text: "Header"
            }
        }
    }

    Component {
        id: footerComponent

        Rectangle {
            width: listView.width
            height: 32
            color: "yellow"

            Text {
                id: text
                text: "FooterComponent"
            }
        }
    }
}
