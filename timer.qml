import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

Window {
    id: root
    visible: true
    width: 170
    height: 50
    title: qsTr("Timer")
    color: systemPalette.window
    property int max: 90
    property string start: "Start"

    SystemPalette {
        id: systemPalette;
        colorGroup: SystemPalette.Active
    }
    Text {
        id: text
        text: root.start
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 24
        font.family: "ubuntu mono"
        width: root.width; height: root.height;
        color: systemPalette.text

        MouseArea {
            id: playArea
            anchors.fill: parent
            onPressed: {
                if (!timer.running) {
                    timer.count = root.max
                    text.text = timer.count
                    timer.start()
                }
            }
        }
        Timer {
            id: timer
            interval: 1000
            property int count: root.max
            onTriggered: {
                --count;
                if (count > 0) {
                    text.text = count
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
                text.text = root.start
            }
        }
    }
}
