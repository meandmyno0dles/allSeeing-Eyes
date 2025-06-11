// ui/main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: root
    width: 200
    height: 100

    Rectangle {
        id: leftEye
        width: 80; height: 80
        radius: 40
        color: "white"
        border.color: "black"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            id: leftPupil
            width: 20; height: 20
            radius: 10
            color: "black"
            x: Math.min(leftEye.width - width, Math.max(0, (cursorX - leftEye.mapToGlobal(Qt.point(0,0)).x - width/2)))
            y: Math.min(leftEye.height - height, Math.max(0, (cursorY - leftEye.mapToGlobal(Qt.point(0,0)).y - height/2)))
        }
    }

    Rectangle {
        id: rightEye
        width: 80; height: 80
        radius: 40
        color: "white"
        border.color: "black"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            id: rightPupil
            width: 20; height: 20
            radius: 10
            color: "black"
            x: Math.min(rightEye.width - width, Math.max(0, (cursorX - rightEye.mapToGlobal(Qt.point(0,0)).x - width/2)))
            y: Math.min(rightEye.height - height, Math.max(0, (cursorY - rightEye.mapToGlobal(Qt.point(0,0)).y - height/2)))
        }
    }

    property int cursorX: 0
    property int cursorY: 0

    Timer {
        interval: 30
        running: true
        repeat: true
        onTriggered: {
            var pos = PlasmaCore.CursorPos.position
            cursorX = pos.x
            cursorY = pos.y
        }
    }
}
