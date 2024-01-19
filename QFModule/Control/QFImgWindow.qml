import QtQuick
import QtQuick.Dialogs
import ImageItem
Item{
    id:root
    property url source

    ImageItem{
        id:img
        anchors.fill:parent

        onImageChanged:{
            console.log("changed");
        }
    }
    function loadImage(url) {
        img.loadImage(url);
    }

}