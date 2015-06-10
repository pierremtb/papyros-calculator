import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import "script.js" as Script
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0

Rectangle {
    property string target: "default"
    property string label: "default"
    property bool upper: true
    property int fontSize: 14
    Label {
        text:label
        color: "white"
        font.pixelSize:  Units.dp(fontSize)
        style: "title"
        font.capitalization: upper ? Font.AllUppercase : Font.AllMixedcase
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    color: "transparent"
    id:button
    width: bigsize ? calculator.width / 8 : Units.dp(50)
    radius: (width + height)/4
    height: fn.height / 4
    Ink {
        anchors.fill: parent
        circular: true
        onPressed: {
                if(target == "X")
                  entry.text += entry.varx
                else if (target == ">X")
                  entry.varx = entry.text
                else
                entry.text += target
            }
        }
}
