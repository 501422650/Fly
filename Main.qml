import QtQuick
import QFModule
import QtQuick3D
import QtQuick3D.Helpers
Window {
    width: 1000
    height: 700
    visible: true
    title: qsTr("Hello World")
    Image {
        id: bg1
        source: "qrc:/qt/qml/Fly/res/bg-1.png"
        anchors.fill: parent
    }

    BorderImage {
        id: bg2
        source: "qrc:/qt/qml/Fly/res/bg-2.png"
        x:10
        width: parent.width-300
        height: parent.height-30
        anchors.verticalCenter: parent.verticalCenter
        border.left: 401; border.top: 90
        border.right: 90; border.bottom: 139
        View3D{
            id:view
            anchors.fill :parent
            anchors.margins:70
            environment: SceneEnvironment {
                clearColor: "transparent"
                backgroundMode: SceneEnvironment.Color
                InfiniteGrid {
                    gridInterval: 100
                }
            }

            Node{
                id: originNode
                position:mesh.position
                PerspectiveCamera {
                    id: cameraNode
                    z: 928
                    onZChanged:{
                        if (z<500){
                            z=500;
                        }
                    }
                }
            }
            OrbitCameraController {
                anchors.fill: parent
                origin: originNode
                camera: cameraNode
            }
            DirectionalLight {
                eulerRotation.x: -30
                eulerRotation.y: -70
            }
            DirectionalLight {
                eulerRotation.x: 30
            }
            // Model {
            //     property int angle:0
            //     position: Qt.vector3d(100, 0, 0)
            //     rotation:Quaternion.fromAxisAndAngle(0,0,1,90)
            //     source: "#Cylinder"
            //     scale: Qt.vector3d(2, 0.1, 2)
            //     materials: [ DefaultMaterial {
            //         diffuseColor: "red"
            //     }
            //     ]
            //     SequentialAnimation on angle {
            //         loops: Animation.Infinite
            //         NumberAnimation {
            //             duration: 3000
            //             to: 360
            //             from: 0
            //             easing.type:Easing.Linear
            //         }
            //     }
            // }

            Model {
                id:mesh
                position: Qt.vector3d(0, 0, 0)
                source: "qrc:/qt/qml/Fly/res/prt0005_mesh.mesh"

                materials: [
                    CustomMaterial{
                        shadingMode: CustomMaterial.Unshaded
                        vertexShader: "qrc:/qt/qml/Fly/res/shapes.vert"
                        fragmentShader: "qrc:/qt/qml/Fly/res/shapes.frag"
                        property TextureInput tex: TextureInput {
                            enabled: true
                            texture: Texture { source: "qrc:/qt/qml/Fly/res/white_granite.jpg" }
                        }
                        property real r:mesh.r
                        property real b:mesh.b
                        property real g:mesh.g
                    }
                ]
                property real r
                property real b
                property real g
                SequentialAnimation on r{
                    loops: Animation.Infinite
                    NumberAnimation { from: 0; to: 1; duration: 5000;easing.type:Easing.InQuad }
                    NumberAnimation { from: 1; to: 0; duration: 5000;easing.type:Easing.OutQuad }
                }
                SequentialAnimation on b{
                    loops: Animation.Infinite
                    NumberAnimation { from: 0; to: 1; duration: 3000;easing.type:Easing.InQuad}
                    NumberAnimation { from: 1; to: 0; duration: 3000;easing.type:Easing.OutQuad}
                }
                SequentialAnimation on g{
                    loops: Animation.Infinite
                    NumberAnimation { from: 0; to: 1; duration: 2000;easing.type:Easing.InQuad}
                    NumberAnimation { from: 1; to: 0; duration: 2000;easing.type:Easing.OutQuad }
                }
            }
        }
    }

    BorderImage {
        id: bg3
        source: "qrc:/qt/qml/Fly/res/bg-3.png"
        anchors.left :bg2.right
        anchors.leftMargin:20
        anchors.top :bg2.top
        anchors.bottom:button1.top
        anchors.bottomMargin: 20
        anchors.right:parent.right
        anchors.rightMargin:20
        anchors.margins:20
        anchors.verticalCenter: parent.verticalCenter
        border.left: 142; border.top: 31
        border.right: 100; border.bottom: 29
    }

    QFButton{
        id:button1
        width: 250
        height: 95
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        text:"连接"
        onClicked:{
            console.log("click")
        }
    }
}
