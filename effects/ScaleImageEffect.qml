import QtQuick 2.5

Rectangle {
    width: 480
    height: 240
    color: '#1e1e1e'

    Image {
        id: sourceImage
        width: 160
        height: width
        source: "qrc:/images/effects/lighthouse.jpg"
        visible: false
    }
    Rectangle {
        width: 160
        height: width
        anchors.centerIn: parent
        color: '#333333'
    }
    property var aniNormal: "
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    highp vec4 pos = qt_Vertex;
                    pos.y = mix(qt_Vertex.y, height, minimize);
                    pos.x = mix(qt_Vertex.x, width, minimize);
                    gl_Position = qt_Matrix * pos;
                 }"

    property var aniPrimitiveBending: "
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    highp vec4 pos = qt_Vertex;
                    pos.y = mix(qt_Vertex.y, height, minimize);
                    highp float t = pos.y / height;
                    pos.x = mix(qt_Vertex.x, width, t * minimize);
                    gl_Position = qt_Matrix * pos;
                 }"

    property var animBetterBending: "
                uniform highp float bend;
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    highp vec4 pos = qt_Vertex;
                    pos.y = mix(qt_Vertex.y, height, minimize);
                    highp float t = pos.y / height;
                    t = (3.0 - 2.0 * t) * t * t;
                    pos.x = mix(qt_Vertex.x, width, t * bend);
                    gl_Position = qt_Matrix * pos;
                 }"

    property var animChoosingSides: "
                uniform highp float bend;
                uniform highp float side;
                void main() {
                    qt_TexCoord0 = qt_MultiTexCoord0;
                    highp vec4 pos = qt_Vertex;
                    pos.y = mix(qt_Vertex.y, height, minimize);
                    highp float t = pos.y / height;
                    t = (3.0 - 2.0 * t) * t * t;
                    pos.x = mix(qt_Vertex.x, side * width, t * bend);
                    gl_Position = qt_Matrix * pos;
                 }"

    // 吸收效果
    ShaderEffect {
        id: genieEffect
        width: 160
        height: width
        anchors.centerIn: parent
        property variant source: sourceImage
        property bool minimized: false
        property real minimize: 0.0

        property real bend: 0.0
        property real side: 0.5 // 侧面收缩

        MouseArea {
            anchors.fill: parent
            onClicked: genieEffect.minimized = !genieEffect.minimized
        }


//        SequentialAnimation on minimize {
//            id: animMinimize
//            running: genieEffect.minimized
//            PauseAnimation { duration: 300 }
//            NumberAnimation { to: 1; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1000 }
//        }

//        SequentialAnimation on minimize {
//            id: animNormalize
//            running: !genieEffect.minimized
//            NumberAnimation { to: 0; duration: 700; easing.type: Easing.InOutSine }
//            PauseAnimation { duration: 1300 }
//        }

        vertexShader: "
            uniform highp mat4 qt_Matrix;
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            varying highp vec2 qt_TexCoord0;
            uniform highp float minimize;
            uniform highp float width;
            uniform highp float height;
        " + animChoosingSides

        // change to parallel animation
        ParallelAnimation {
            id: animMinimize
            running: genieEffect.minimized
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                NumberAnimation {
                    target: genieEffect; property: 'minimize';
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine
                }
                PauseAnimation { duration: 1000 }
            }
            // adding bend animation
            SequentialAnimation {
                NumberAnimation {
                    target: genieEffect; property: 'bend'
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1300 }
            }
        }

        mesh: GridMesh { resolution: Qt.size(16, 16) }
    }
}
