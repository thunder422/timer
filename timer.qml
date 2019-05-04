import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtMultimedia 5.12

Window {
    id: root
    visible: true
    width: 170
    height: 50
    title: qsTr("Timer")
    color: systemPalette.window
    property int start_time: 90
    property string start_text: "Start"

    SystemPalette {
        id: systemPalette;
        colorGroup: SystemPalette.Active
    }
    Text {
        id: text
        text: root.start_text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 24
        font.family: "ubuntu mono"
        width: root.width; height: root.height;
        color: systemPalette.text

        MouseArea {
            id: playArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed: {
                if (!timer.running) {
                    if (mouse.button === Qt.RightButton) {
                        contextMenu.popup();
                    } else {
                        timer.count = root.start_time
                        text.setTime(timer.count)
                        timer.start()
                    }
                }
            }
        }
        Timer {
            id: timer
            interval: 1000
            property int count: root.start_time
            onTriggered: {
                --count;
                if (count > 0) {
                    text.setTime(count)
                    start()
                } else {
                    playSound.play()
                    text.text = "Done"
                }
            }
        }
        SoundEffect {
            id: playSound
            source: "times_up.wav"
            onPlayingChanged: {
                text.text = root.start_text
            }
        }

        function setTime(seconds) {
            var minutes = Math.floor(seconds / 60)
            seconds = seconds - minutes * 60
            text.text = pad2(minutes) + ":" + pad2(seconds)
        }

        function pad2(number) {
            return ("0" + number).slice(-2)
        }
    }
    Menu {
        id: contextMenu

        MenuItem {
            text: "00:60"
            onTriggered: {
                root.start_time = 60
            }
        }
        MenuItem {
            text: "01:30"
            onTriggered: {
                root.start_time = 90
            }
        }
    }
}
