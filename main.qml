import QtQuick 2.12
import QtQuick.Particles 2.12
import QtQuick.Window 2.12

Window {
    id: colorizerGif
    visible: true
    width: 1920
    height: 1080
    color: "black"
    visibility: "FullScreen"

    property bool  active: true

    Timer{
        id: garbaggeCall
        running: true
        interval: 60000
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            console.log("time", new Date())
//            console.log("call garbagge collector", new Date())
//            gc();
        }
    }

    Item{
        id: particlesContainer
        anchors.fill: parent
        anchors.margins: -5

        ParticleSystem {
            id: particleSystem
            running: true
        }

        ImageParticle {
            id: particle
            source: "arrow.png"
            system: particleSystem
            autoRotation: true
        }

        Emitter{
            id: emitter
            anchors.fill: parent
            system: particleSystem
            emitRate: 510
            lifeSpan: 7000
            size: 3
        }

        Attractor {
            anchors.fill: parent
            pointX: width/2
            pointY: height/2
            strength: 1000
            affectedParameter: Attractor.Velocity
            proportionalToDistance: Attractor.InverseLinear
            system: particleSystem
        }
    }
}
