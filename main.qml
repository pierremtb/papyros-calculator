import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import "script.js" as Script
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: calculator
    visible: true
    title: 'Calculator'
    flags: Qt.WindowCloseButtonHint|Qt.WindowMinimizeButtonHint
    property bool bigsize: true
    property string accentchosen: "#009688"
    width: bigsize ? 329 : 210
    height:bigsize ? 268 : 253
    maximumHeight: bigsize ? 268 : 253
    minimumHeight: bigsize ? 268 : 253
    maximumWidth: bigsize ? 329 : 210
    minimumWidth: bigsize ? 329 : 210
    theme {
        accentColor: accentchosen
        primaryColor: "#009688"
    }        
    Settings {
        property alias accentchosen: calculator.accentchosen
        property alias bigsize: calculator.bigsize
    }
    initialPage: ee  
    Page {
        id: ee
        actionBar.hidden: true
        Component.onCompleted:
        {
        entry.forceActiveFocus()
        }
        
        Rectangle {
            id: num
            x:bigsize == true ? 125 : 2
             Behavior on x {
                NumberAnimation { duration: 200 }
            }
            y:tr.height
            width: 165
            height: 200
            color: "#444345"
            Column {
                x:-5
                y:0
                width: 50
                height: 200
                Button {
                    text: "7"
                    id:b_7
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_7.text
                        }
                }
                Button {
                    text: "4"
                    id:b_4
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_4.text
                    }
                }
                Button {
                    text: "1"
                    id:b_1
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_1.text
                        }
                }
                Button {
                    text: "0"
                    id:b_0
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_0.text
                        }
                    
                }
            }
            Column {
                x:38
                y:0
                width: 50
                height: 200
                Button {
                    text: "8"
                    id:b_8
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_8.text
                        }
                }
                Button {
                    text: "5"
                    id:b_5
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_5.text
                        }
                }
                Button {
                    text: "2"
                    id:b_2
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += b_2.text
                        }
                }
                Button {
                    text: "."
                    id:b_dot
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_dot.text
                        }
                    
                }
            }
            Column {
                x: 55
                y: 0
                width: 100
                height: 100
                Button {
                    text: "9"
                    id:b_9
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_9.text
                        }
                    
                }
                Button {
                    text: "6"
                    id:b_6
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: entry.text += b_6.text
                        
                    
                }
                Button {
                    text: "3"
                    id:b_3
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: entry.text += b_3.text
                }
                Button {
                    text: "="
                    id:b_go
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked:result.text = Script.Evaluer(entry.text)
                }
            }
            Column {
                x: 95
                y: 0
                width: 100
                height: 100
                Button {
                    text: "X"
                    id:b_X
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += entry.varx
                        }
                }
                Button {
                    text: "->X"
                    id:b_attrX
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            result.text = Script.Evaluer(entry.text)
                           	entry.varx = result.text
                        }
                }
                Button {
                    text: "("
                    id:b_parleft
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_parleft.text
                        }
                }
                Button {
                    text: ")"
                    id:b_parright
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_parright.text
                        }
                }
            }
        }
        Rectangle {
            id: pag
            x:bigsize ? 125+165 : 166
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
            y:tr.height
            width: units.dp(50)
            height: 200
            color: "#646264"
            Column {
                x: 7
                y: 0
                width: 30
                height: 100
                Button {
                    text: "+"
                    id:b_plus
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_plus.text
                        }
                }
                Button {
                    text: "-"
                    id:b_minus
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_minus.text
                        }
                }
                Button {
                    text: "×"
                    id:b_cross
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += '*'
                        }
                }
                Button {
                    text: "÷"
                    id:b_div
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += '/'
                        }
                }
            }
        }
        Rectangle {
            id: fn
            x:0
            y:tr.height
            width: 125
            height: 200
            color: Theme.accentColor
            Column {
                x:-5
                y:0
                width: 50
                height: 200
                Button {
                    text: "√"
                    id:b_sqrt
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'sqrt('
                        }
                }
                Button {
                    text: "cos"
                    id:b_cos
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'cos('
                        }
                }
                Button {
                    text: "acos"
                    id:b_acos
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    MouseArea {
                        id: ma_acos
                        anchors.fill: parent
                        onPressed: {
                            entry.text += 'acos('
                        }
                    }
                }
                Button {
                    text: "exp"
                    id:b_exp
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'exp('
                        }
                }
                    
            }
            Column {
                x:38
                y:0
                width: 50
                height: 200
                Button {
                    text: "^"
                    id:b_pow
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'pow('
                        }
                }
                Button {
                    text: "sin"
                    id:b_sin
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'sin('
                        }
                }
                Button {
                    text: "asin"
                    id:b_asin
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'asin('
                        }
                }
                Button {
                    text: "ln"
                    id:b_ln
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'ln('
                        }
                }
            }
            Column {
                x:80
                y:0
                width: 50
                height: 200
                Button {
                    text: ","
                    id:b_coma
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += b_coma.text
                        }
                }
                Button {
                    text: "tan"
                    id:b_tan
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'tan('
 1                        }
                }
                Button {
                    text: "atan"
                    id:b_atan
                    width: units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'atan('
                        }
                }
                Button {        
                    text: 'π'
                    id:b_pi
                    width: units.dp(50)
                    textColor: 'white'
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                            entry.text += 'pi'
                        }
                }
                    
            }

        }
        Item {
            id:tr 
            width: parent.width
            height: bigsize ? 110 : 95
            Behavior on height {
                    NumberAnimation { duration: 200 }
                }
            Keys.onEnterPressed:result.text = Script.Evaluer(entry.text)
            Keys.onReturnPressed:result.text = Script.Evaluer(entry.text)
            Ink {
                id: mouseArea
                anchors.fill: parent
                color: Qt.rgba(0,0,0,0)
                opacity:1
                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }
                middleSize:calculator.width * 4
                Connections {
                    target: elev
                    onPressed: console.log(" ")
                    onCanceled: mouseArea.onCanceled()
                    onReleased: mouseArea.onReleased(mouse)
                }
            }
            View {
                id:elev
                elevation:1
                anchors {
                    fill: parent
                }
                TextInput {
                    id:entry
                    property string varx:''
                    selectByMouse: true
                    selectionColor : 'lightgray'
                    width:bigsize == true ? 265 : 150
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 5
                    text:''
                    font.pointSize: entry.text.length < 20 ? 18 : 13
                    color:'#757575'
                    Settings {
                        property alias varx: entry.varx
                    }
                }
                Text {
                    id:result
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 6
                    anchors.bottomMargin: 10
                    text:' '
                    color:'#212121'
                    font.pointSize: bigsize && result.text.length > 15 ? 17 : bigsize && result.text.length > 8 ? 20 : bigsize ? 26 : !bigsize && result.text.length > 10 ? 13 : 20
                }
            }
        }
        Icon {
            id:del
            visible: entry.text=='' ? false : true
            anchors.top: parent.top
      		anchors.right: parent.right
       		anchors.margins:5
            anchors.rightMargin:30
            name: "navigation/arrow_back"
            MouseArea {
                 Timer {
                     id: timer1
                     interval: 400; running: false; repeat: false
                     onTriggered: {
                        entry.text = '';
                        result.text = '';
                        mouseArea.opacity = 0;
                    }
                 }
                Timer {
                     id: timer2
                     interval: 1000; running: false; repeat: false
                     onTriggered: {
                        mouseArea.currentCircle.removeCircle();
                }
                 }
                id: ma_del
                anchors.fill: parent
                onPressed: {
                     entry.text = entry.text.replace(/(\s+)?.$/, '')
                }
                onDoubleClicked: {
                    mouseArea.opacity = 1;
                    mouseArea.color = '#4CAF50';
                    mouseArea.createTapCircle(calculator.width,0);
                    timer1.running = true;
                    timer2.running = true;
                }

            }
        }
        Icon {
            id:menu
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins:5
            name: "navigation/menu"
            MouseArea {
                id: ma_menu
                anchors.fill: parent
                onPressed: 
                {
                    drawer.x = bigsize ? 129 : 10
                    shadow_drawer.opacity = 1

                }
            }
        }
    }

    Rectangle {
        id:drawer
        color:'white'
        width:200
        x:329
        z:2
        Behavior on x {
            NumberAnimation { duration: 200 }
        }
        anchors {
                top: parent.top
                bottom: parent.bottom
        }  
        View {
            anchors {
                fill: parent
                margins: units.dp(0)
            }
            elevation: 1
            Column {
                anchors.fill: parent
                ListItem.Header {
                    text: "Settings"                 
                }
                ListItem.Standard {
                    text: "Show numbers"
                    Switch {
                        id:sw_bigsize
                        checked: calculator.bigsize
                        darkBackground: false
                        anchors {
                            top: parent.top
                            right: parent.right
                            topMargin:10
                            rightMargin:20
                        }
                    }
                }
                ListItem.Standard {
                    id:themechooser
                    text: 'Accent Chooser'
                    MouseArea {
                        anchors.fill: parent
                        onPressed: accent_chooser_palette.open(accentcolor_sample, units.dp(4), units.dp(-24))
                    }
                    Rectangle {
                        width:30
                        height:30
                        id:accentcolor_sample
                        radius: width*0.5
                        color:Theme.accentColor
                        anchors {
                                top: parent.top
                                right: parent.right
                                topMargin:6
                                rightMargin:20
                        }
                        MouseArea {
                        anchors.fill: parent
                        onPressed: accent_chooser_palette.open(accentcolor_sample, units.dp(4), units.dp(-24))
                    }
                    }
                }
                AccentPaletteDropdown {
                id:accent_chooser_palette
           }
            }
            Item {           
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    bottomMargin:25
                }
                height:30
                Button {
                    text: "Save"
                    backgroundColor: Theme.accentColor
                    elevation: 1
                    x:30
                    onClicked: {
                            drawer.x = 329
                            shadow_drawer.opacity = 0
                            calculator.accentchosen = accentcolor_sample.color
                            calculator.bigsize = sw_bigsize.checked   
                        }
                }
                Button {
                    text: "Abort"
                    x:103
                    elevation: 1
                    textColor: Theme.accentColor
                    onClicked: {
                            drawer.x = 329
                            shadow_drawer.opacity = 0
                            sw_bigsize.checked = calculator.bigsize
                            accentcolor_sample.color = calculator.accentchosen
                        }
                }
            }
        }
    }
    Rectangle {
        id: shadow_drawer
        width:calculator.width
        height:calculator.height
        color: Qt.rgba(0.1, 0.1, 0.1, 0.5)
        opacity: 0
        z:1
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }
}



