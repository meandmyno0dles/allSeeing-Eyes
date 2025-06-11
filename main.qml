import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15
import QtQml 2.15
import QtQuick.XmlListModel 2.0
import Qt.labs.platform 1.1

Window {
    id: root
    visible: true
    width: 100
    height: 100
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool

    property bool mouseClicked: false

    Process {
        id: pythonBackend
        command: "/usr/bin/python3"
        arguments: ["contents/code/main.py"]
        onStarted: console.log("Python backend started")
        onErrorOccurred: console.log("Backend error occurred: " + error)
        Component.onCompleted: start()
    }

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
