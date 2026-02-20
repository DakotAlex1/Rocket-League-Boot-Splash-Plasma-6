import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    color: "black" // Fallback if image fails
    anchors.fill: parent

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Image {
        id: background
        anchors.fill: parent
        source: "images/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        Image {
            id: logo
            anchors.centerIn: parent
            source: "images/rocketleaguelogo.png"
            sourceSize.width: 135
            sourceSize.height: 135

            ParallelAnimation {
                running: true
                ScaleAnimator { target: logo; from: 0; to: 1; duration: 700 }
                SequentialAnimation {
                    loops: Animation.Infinite
                    OpacityAnimator { target: logo; from: 0.75; to: 1; duration: 1200 }
                    OpacityAnimator { target: logo; from: 1; to: 0.75; duration: 1200 }
                }
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
