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
    property bool bigsize: true
    property string accentchosen: "#009688"
    maximumHeight: Units.dp(270)
    minimumHeight: Units.dp(270)
    maximumWidth: bigsize ? Units.dp(400) : Units.dp(247)
    minimumWidth: bigsize ? Units.dp(400) : Units.dp(247)
    theme {
        accentColor: accentchosen
        primaryColor: "#009688"
    }
    Settings {
        property alias accentchosen: calculator.accentchosen
        property alias bigsize: calculator.bigsize
    }
    initialPage: main
    Page {
        id: main
        actionBar.hidden: true
        anchors.topMargin: Units.dp(20)
        Component.onCompleted: entry.forceActiveFocus()
        Item {
            id:tr
            width: parent.width
            height: bigsize ? Units.dp(120) : Units.dp(120)
            Behavior on height { NumberAnimation { duration: 200 } }
            Keys.onReturnPressed:result.text = Script.Evaluer(entry.text)
            Keys.onEnterPressed:result.text = Script.Evaluer(entry.text)
            Ink {
                id: mouseArea
                anchors.fill: parent
                color: Qt.rgba(0,0,0,0)
                opacity:1
                Behavior on opacity { NumberAnimation { duration: 200 } }
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
                    width:bigsize == true ? calculator.width - Units.dp(60) : 150
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: Units.dp(8)
                    text:''
                    font.pointSize: entry.text.length < 20 ? 18 : 13
                    onTextChanged:result.text = Script.Evaluer(entry.text)
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
                    Behavior on font.pointSize {
                       NumberAnimation { duration: 200 }
                   }
                    font.pointSize: bigsize && result.text.length > 15 ? Units.dp(18) : bigsize && result.text.length > 10 ? Units.dp(25) : bigsize ? Units.dp(29) : !bigsize && result.text.length > 15 ? Units.dp(12) :  !bigsize && result.text.length > 10 ? Units.dp(17) : Units.dp(25)
                }
            }
            }
            Icon {
                id:del
                visible: entry.text=='' ? false : true
                anchors.top: parent.top
                width:18
                height:width
          		anchors.right: parent.right
           		anchors.margins:5
                anchors.rightMargin:25
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
                        mouseArea.color = Theme.accentColor;
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
                width:18
                height:width
                name: "navigation/menu"
                MouseArea {
                    id: ma_menu
                    anchors.fill: parent
                    onPressed:
                    {
                        drawer.open();

                    }
                }
            }

        Rectangle {
            id: fn
            y:tr.height
            z:2
            width: Units.dp(150)
            height: Units.dp(151)
            color: /*Theme.accentColor*/ calculator.accentchosen
            Row {
                Column {
                    width: Units.dp(50)
                    Button {
                        text: "√"
                        id:b_sqrt
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'sqrt('
                        }
                    }
                    Button {
                        text: "cos"
                        id:b_cos
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'cos('
                        }
                    }
                    Button {
                        text: "acos"
                        id:b_acos
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'acos('
                        }
                    }
                    Button {
                        text: "exp"
                        id:b_exp
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'exp('
                        }
                    }

                }
                Column {
                    width: Units.dp(50)
                    Button {
                        text: "^"
                        id:b_pow
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'pow('
                        }
                    }
                    Button {
                        text: "sin"
                        id:b_sin
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'sin('
                        }
                    }
                    Button {
                        text: "asin"
                        id:b_asin
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'asin('
                        }
                    }
                    Button {
                        text: "ln"
                        id:b_ln
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'ln('
                        }
                    }
                }
                Column {
                    width: Units.dp(50)
                    Button {
                        text: ","
                        id:b_coma
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_coma.text
                        }
                    }
                    Button {
                        text: "tan"
                        id:b_tan
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'tan('
                        }
                    }
                    Button {
                        text: "atan"
                        id:b_atan
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'atan('
                        }
                    }
                    Button {
                        text: 'π'
                        id:b_pi
                        width: Units.dp(50)
                        textColor: 'white'
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'pi'
                            result.text = Script.Evaluer(entry.text)
                        }
                    }
                }
            }
        }
        Rectangle {
            id: num
            x: bigsize ? fn.width : 0
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
            y: tr.height
            width: Units.dp(200)
            height: Units.dp(151)
            color: "#444345"
            Row {
                Column {
                    width: Units.dp(50)
                    Button {
                        text: "7"
                        id:b_7
                        width: Units.dp(50)
                        anchors.horizontalCenter: parent.horizontalCenter
                        textColor: "white"
                        onClicked: {
                            entry.text += b_7.text
                        }
                    }
                    Button {
                        text: "4"
                        id:b_4
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_4.text
                        }
                    }
                    Button {
                        text: "1"
                        id:b_1
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_1.text
                        }
                    }
                    Button {
                        text: "0"
                        id:b_0
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_0.text
                        }
                    }
                }
                Column {
                    width: Units.dp(50)
                    Button {
                        text: "8"
                        id:b_8
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_8.text
                        }
                    }
                    Button {
                        text: "5"
                        id:b_5
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_5.text
                        }
                    }
                    Button {
                        text: "2"
                        id:b_2
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_2.text
                        }
                    }
                    Button {
                        text: "."
                        id:b_dot
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_dot.text
                        }

                    }
                }
                Column {
                    width: Units.dp(50)
                    Button {
                        text: "9"
                        id:b_9
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_9.text
                        }
                    }
                    Button {
                        text: "6"
                        id:b_6
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_6.text
                        }
                    }
                    Button {
                        text: "3"
                        id:b_3
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_3.text
                        }
                    }
                    Button {
                        text: "="
                        id:b_go
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked:result.text = Script.Evaluer(entry.text)
                    }
                }
                Column {
                    id: other
                    width: Units.dp(50)
                    Button {
                        text: "X"
                        id:b_X
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += entry.varx
                        }
                    }
                    Button {
                        text: "->X"
                        id:b_attrX
                        width: Units.dp(50)
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
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_parleft.text
                        }
                    }
                    Button {
                        text: ")"
                        id:b_parright
                        width: Units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_parright.text
                        }
                    }
                }
            }
        }
        Rectangle {
            id: signs
            x:bigsize ? fn.width + num.width : fn.width + other.width
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
            y:tr.height
            width: Units.dp(50)
            height: Units.dp(151)
            color: "#646264"
            Column {
                width: Units.dp(50)
                height: Units.dp(151)
                Button {
                    text: "+"
                    id:b_plus
                    width: Units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += b_plus.text
                    }
                }
                Button {
                    text: "-"
                    id:b_minus
                    width: Units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += b_minus.text
                    }
                }
                Button {
                    text: "×"
                    id:b_cross
                    width: Units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += '*'
                    }
                }
                Button {
                    text: "÷"
                    id:b_div
                    width: Units.dp(50)
                    textColor: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += '/'
                    }
                }
            }
        }
        Rectangle {
            id: shadow_drawer
            width:calculator.width
            height:calculator.height
            color: Qt.rgba(0.1, 0.1, 0.1, 0.3)
            opacity: 0
            z:2
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }
        Rectangle {
            id:drawer
            color:'white'
            width: Units.dp(230)
            x: bigsize ? Units.dp(400) : Units.dp(247)
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
                    margins: Units.dp(0)
                }
                elevation: 1
                Column {
                    anchors.fill: parent
                    ListItem.Subheader {
                        text: "Settings"
                    }
                    ListItem.Standard {
                        text: "Show numbers"
                        Switch {
                            id:sw_bigsize
                            checked: calculator.bigsize
                            darkBackground: false
                            onClicked: {
                                 calculator.bigsize = sw_bigsize.checked
                                 drawer.close()
                            }
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
                        text: 'Select AccentColor'
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                colorPicker.show();
                                drawer.close();
                           }
                        }
                    }
                }
                Item {
                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                        right: parent.right
                        bottomMargin: Units.dp(10)
                    }
                    height:Units.dp(35)
                    Button {
                        text: "Close"
                        anchors.horizontalCenter: parent.horizontalCenter
                        elevation: 0
                        textColor: Theme.accentColor
                        onClicked: {
                                drawer.close();
                        }
                    }
                }
            }
            function open()
            {
              drawer.x = bigsize ? Units.dp(170) : Units.dp(17);
              shadow_drawer.opacity = 1;
            }
            function close()
            {
              drawer.x = bigsize ? Units.dp(400) : Units.dp(247);
              shadow_drawer.opacity = 0;
            }
        }
        Dialog {
            id: colorPicker
            property string old_accentColor:theme.accentColor
            title: "Pick color"
            y:10
            positiveButtonText: "Done"
            negativeButtonText: ""
            Grid {
                anchors.topMargin: Units.dp(20)
                anchors.leftMargin: Units.dp(10)
                columns: bigsize ? 7 : 6
                spacing: bigsize ? Units.dp(8) : Units.dp(6)
                Repeater {
                    model: [
                        "red", "pink", "purple", "deepPurple", "indigo",
                        "blue", "lightBlue", "cyan", "teal", "green",
                        "lightGreen", "lime", "yellow", "amber", "orange",
                        "deepOrange", "grey", "blueGrey", "brown", "black",
                        "white"
                    ]
                    Rectangle {
                        width: Units.dp(30)
                        height: Units.dp(30)
                        radius: Units.dp(2)
                        color: Palette.colors[modelData]["500"]
                        border.width: modelData === "white" ? Units.dp(2) : 0
                        border.color: Theme.alpha("#000", 0.26)
                        Ink {
                            anchors.fill: parent
                            onPressed: {
                                    calculator.accentchosen = parent.color
                                    entry.forceActiveFocus()
                                }
                            }
                        }
                    }
                }
            onRejected: {
                accentchosen = colorPicker.old_accentColor
            }
        }
    }
}
