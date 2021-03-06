import QtQuick 2.0
import Sailfish.Silica 1.0

BackgroundItem {
    property string name: ""
    property variant price: 0
    property variant rPrice: normalizePrice(price)
    property string address: ""
    property int distance: -1
    property string stId: ""
    property string message;
    //onCustomMessageChanged: if( customMessage == "" ) customMessage = false



    height: img.paintedHeight + Theme.paddingSmall*2
    Item {
        anchors.margins: Theme.horizontalPageMargin
        anchors.left: parent.left
        anchors.right: parent.right
        height: img.paintedHeight + Theme.paddingSmall*2
        Label {
            id: img
            anchors {
                left: parent.left
                top: parent.top
                verticalCenter: parent.verticalCenter
            }
            width: paintedWidth
            color: !down?Theme.highlightColor:Theme.secondaryHighlightColor
            opacity: isFav( stId )?1:0.7
            text: rPrice[0]
            font.pixelSize: Theme.fontSizeExtraLarge
            Label {
                anchors.top: parent.top
                anchors.left: parent.right
                anchors.leftMargin: -Theme.paddingSmall/4
                verticalAlignment: Text.AlignTop
                text: rPrice[1]
                scale: 0.7
                height: paintedHeight*scale
                width: paintedWidth*scale
                color: parent.color
                font.pixelSize: parent.font.pixelSize
            }

        }
        Label {
            id: nm
            anchors {
                leftMargin: Theme.paddingMedium*3
                right: parent.right
                left: img.right
                top: srt.text==""?img.top:parent.top
            }
            verticalAlignment: Text.AlignTop
            height: paintedHeight
            color: down ? Theme.highlightColor : Theme.primaryColor
            text: name
            font.pixelSize: srt.text==""?img.font.pixelSize:Theme.fontSizeMedium
            truncationMode: TruncationMode.Fade
        }
        Label {
            id: srt
            anchors {
                leftMargin: Theme.paddingMedium*3
                right: parent.right
                left: img.right
                bottom: parent.bottom
            }
            height: paintedHeight
            color: down ? Theme.secondaryHighlightColor : Theme.secondaryColor
            font.pixelSize: Theme.fontSizeSmall
            text: (distance<0?"":(selectedPlugin.units.distance=="km"?distance<1000?distance+"m":Math.ceil(distance/1000)+"km":distance+selectedPlugin.units.distance)+" | ")+(message?message+" | ":"")+address
            truncationMode: TruncationMode.Fade
        }
    }
}
