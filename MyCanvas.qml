import QtQuick 2.0

Canvas {
    id: root
    // canvas size
    width: 1200;
    height: 800

    Rectangle {
        anchors.fill: parent
        color: "gray"
        opacity: 0.1
    }

    // handler to override for drawing
//    onPaint: {
//        // get context to draw with
//        var ctx = getContext("2d")
//        // setup the stroke
//        ctx.lineWidth = 4
//        ctx.strokeStyle = "blue"
//        // setup the fill
//        ctx.fillStyle = "steelblue"

//        // begin a new path to draw
//        ctx.beginPath()
//        // top-left start point
//        ctx.moveTo(50,50)
//        // upper line
//        ctx.lineTo(150,50)
//        // right line
//        ctx.lineTo(150,150)
//        // bottom line
//        ctx.lineTo(50,150)
//        // left line through path closing
//        ctx.closePath()

//        // fill using fill style
//        ctx.fill()
//        // stroke using line width and stroke style
//        ctx.stroke()
//    }

      // 便捷API
//    onPaint: {
//        var ctx = getContext("2d")
//        ctx.fillStyle = 'green'
//        ctx.strokeStyle = "blue"
//        ctx.lineWidth = 4

//        // draw a filles rectangle
//        ctx.fillRect(20, 20, 80, 80)
//        // cut our an inner rectangle
//        ctx.clearRect(30, 30, 60, 60)

//        // stroke a border from top-left to
//        // inner center of the larger rectangle
//        ctx.strokeRect(20, 20, 40, 40)
//    }

    // 渐变
//    onPaint: {
//        var ctx = getContext("2d")

//        var gradient = ctx.createLinearGradient(100,0,100,200)
//        gradient.addColorStop(0, "blue")
//        gradient.addColorStop(0.5, "lightsteelblue")
//        ctx.fillStyle = gradient
//        ctx.fillRect(50,50,100,100)
//    }

    // 阴影
//    onPaint: {
//        var ctx = getContext("2d")

//        // setup a dark background
//        ctx.strokeStyle = "#333"
//        ctx.fillRect(0,0,root.width,root.height);

//        ctx.shadowColor = "blue";
//        ctx.shadowOffsetX = 10;
//        ctx.shadowOffsetY = 20;
//        // next line crashes，级别过高卡死
//         ctx.shadowBlur = 10;

//        ctx.font = 'bold 80px Arial';
//        ctx.fillStyle = "#33a9ff";
//        ctx.fillText("Earth", 0, 100);
//    }

//    onPaint: {
//        var ctx = getContext("2d")


//        // draw an image
//        ctx.drawImage('images/ball.png', 10, 10)

//        // store current context setup
//        ctx.save()
//        ctx.strokeStyle = '#ff2a68'

//        // create a triangle as clip region
//        ctx.beginPath()
//        ctx.moveTo(110,10)
//        ctx.lineTo(155,10)
//        ctx.lineTo(135,55)
//        ctx.closePath()

//        // translate coordinate system
//        ctx.clip()  // create clip from the path
//        // draw image with clip applied
//        ctx.drawImage('images/ball.png', 100, 10)
//        // draw stroke around path
//        ctx.stroke()
//        // restore previous context
//        ctx.restore()

//    }

//    Component.onCompleted: {
//        loadImage("images/ball.png")
//    }

//    Timer {
//        id: timer
//        interval: 1000
//        repeat: true
//        running: true
//        triggeredOnStart: false
//        onTriggered: {
//            scaleValue += 0.2
//            if(scaleValue > 2.0) {
//                scaleValue = 0.0
//            }
//            requestPaint()
//        }

//        property real scaleValue: 1.0
//    }

//    // 变换
//    onPaint: {
//        var ctx = getContext("2d")
//        ctx.save();

//        ctx.lineWidth = 4;
//        ctx.strokeStyle = "blue";

//        // translate x/y coordinate system
//        ctx.translate(root.width/2, root.height/2);
//        ctx.strokeRect(-20, -20, 40, 40)

//        // rotate coordinate system
//        ctx.rotate(Math.PI/4);
//        ctx.scale(timer.scaleValue, timer.scaleValue)

//        console.log("value:", timer.scaleValue)
//        ctx.strokeStyle = "green";

//        // draw path
//        ctx.strokeRect(-20, -20, 40, 40)

//        ctx.restore();
//    }

    // 组合模式
    property var operation : [
           'source-over', 'source-in', 'source-over',
           'source-atop', 'destination-over', 'destination-in',
           'destination-out', 'destination-atop', 'lighter',
           'copy', 'xor', 'qt-clear', 'qt-destination',
           'qt-multiply', 'qt-screen', 'qt-overlay', 'qt-darken',
           'qt-lighten', 'qt-color-dodge', 'qt-color-burn',
           'qt-hard-light', 'qt-soft-light', 'qt-difference',
           'qt-exclusion'
           ]

   onPaint: {
       var ctx = getContext('2d')

       for(var i=0; i<operation.length; i++) {
           var dx = Math.floor(i%6)*100
           var dy = Math.floor(i/6)*100

           ctx.save()
           ctx.fillStyle = '#33a9ff'
           ctx.fillRect(10+dx,10+dy,60,60)

           // TODO: does not work yet
           ctx.globalCompositeOperation = root.operation[i]
           ctx.fillStyle = '#ff33a9'
           ctx.globalAlpha = 0.75

           ctx.beginPath()
           ctx.arc(60+dx, 60+dy, 30, 0, 2*Math.PI)
           ctx.closePath()

           ctx.fill()
           ctx.restore()
       }
   }
}
