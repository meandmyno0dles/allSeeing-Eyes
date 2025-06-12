import QtQuick 6.5
import QtQuick.Window 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 1.15
import QtQuick.Effects 1.15
import QtQml 2.15

Window {
    id: root
    visible: true
    width: 100
    height: 100
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool

    property bool mouseClicked: false

    Item {
        id: eye
        width: 96
        height: 96
        anchors.centerIn: parent

        Image {
            id: eyeImage
            source: "images/sauron1_cleaned.png"
            width: 96
            height: 96
            smooth: true
            anchors.centerIn: parent

            Behavior on x {
                NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
            }
            Behavior on y {
                NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
            }
        }
    }

    Glow {
        anchors.fill: eye
        source: eye
        radius: 10
        samples: 16
        color: mouseClicked ? "orange" : "transparent"
        visible: mouseClicked
    }

    Connections {
        target: cursorTracker
        onPositionChanged: function(x, y) {
            var dx = x - root.x - root.width / 2;
            var dy = y - root.y - root.height / 2;
            eyeImage.x = dx * 0.02 + (eye.width - eyeImage.width) / 2;
            eyeImage.y = dy * 0.02 + (eye.height - eyeImage.height) / 2;
        }
    }

    Timer {
        id: clickTimer
        interval: 300
        running: false
        repeat: false
        onTriggered: mouseClicked = false
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            mouseClicked = true
            clickTimer.start()
        }
    }
}
