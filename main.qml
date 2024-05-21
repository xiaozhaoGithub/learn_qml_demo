import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import "effects"

Window {
    id: globalWindows
    width: 1200
    height: 720
    visible: true
    title: qsTr("Hello World")

    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        ColumnLayout {
//            MyButton { // our Button component
//                   id: button
//    //               x: 12; y: 12
//                   scale: 2
//                   text: "Start"
//                   onClicked: {
//                       status.text = "Button clicked!"
//                       console.log("width:", x)
//                   }
//               }

//            Text { // text changes when button was clicked
//               id: status
//    //           x: 12; y: 76
//    //           width: 116; height: 26
//               text: "waiting ..."
//               horizontalAlignment: Text.AlignHCenter
//            }

//            Rransformation {
//    //            x: 12; y: 200
//            }

//            TextInputGroup {
//            }

//            KeysTest{

//            }
//            Easingtypes {

//            }
//            RepeaterTest{

//            }

//            MyListView{

//            }

//            MyGridView {

//            }

//            MyVariableGridView {

//            }

//            MyShapeShiftListView {

//            }

//            MyPathView {

//            }

//            MyCanvas {

//            }

//            PixelsBuffer {

//            }
//            SimpleSimulation {

//            }
//            SimpleShaderRender {

//            }

//            GenieEffect {
//                source: Image { source: 'qrc:/images/effects/lighthouse.jpg' }
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: parent.minimized = !parent.minimized
//                }
//            }
//            CurtainEffectComponent {

//            }
            TestFastBlur{

            }
        }
    }
}


//Image {
//    id: wheel
//    source: "images/background.png"
//    Behavior on rotation {
//        NumberAnimation {
//            duration: 250
//        }
//    }
//}

