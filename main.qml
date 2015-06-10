/*
* Papyros Calculator - A calculator application for Papyros
* Copyright (C) 2015 Pierre Jacquier
* http://pierre-jacquier.com/
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

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
    x:100
    y:100
    property bool bigsize: true
    property string accentchosen: "#E91E63"
    property var history: []
    property var history_pos: history.length - 1
    height: Units.dp(270)
    minimumHeight:  Units.dp(200)
    width: bigsize ? Units.dp(400) : Units.dp(247)
    minimumWidth: bigsize ? Units.dp(400) : Units.dp(247)
    onWidthChanged: drawer.close()
    theme {
        accentColor: accentchosen
        primaryColor: "#009688"
    }
    Settings {
        property alias accentchosen: calculator.accentchosen
        property alias bigsize: calculator.bigsize
        property alias history: calculator.history
        property alias history_pos: calculator.history_pos
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
            height: calculator.height * 0.45
            Keys.onReturnPressed: {
              if(entry.text != history[history.length - 1])
              {
                    history.push(entry.text);
                    history_pos++;
              }
            }
            Keys.onEnterPressed: {
              if(entry.text != history[history.length - 1])
              {
                    history.push(entry.text);
                    history_pos++;
              }
            }
            Keys.onUpPressed: {
                if(history_pos == history.length - 1 && entry.text != history[history.length - 1])
                {
                    history.push(entry.text);
                    history_pos++;
                }
                history_pos > 0 ? history_pos-- : history_pos = 0;
                entry.text = history[history_pos];
            }
            Keys.onDownPressed: {
                history_pos < history.length - 1 ? history_pos++ : history_pos = history.length - 1
                entry.text = history[history_pos];
            }
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
                    width: calculator.width - Units.dp(60)
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: Units.dp(8)
                    text:history[history_pos]
                    font.pointSize: entry.text.length < 20 ? 18 : 13
                    onTextChanged: {
                        result.text = Script.Evaluer(entry.text);
                        console.log(history);
                        console.log(history_pos);
                    }
                    color:'#757575'
                    Settings {
                        property alias varx: entry.varx
                    }
                }
                Text {
                    id:result
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: Units.dp(8)
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
                visible: entry.text=='' ? false : true
                anchors.top: parent.top
                width: Units.dp(20)
                height:width
          		anchors.right: parent.right
           		anchors.margins: Units.dp(5)
                anchors.rightMargin: Units.dp(30)
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
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    anchors.fill: parent
                    onClicked: {
                        if(mouse.button & Qt.LeftButton)
                           entry.text = entry.text.replace(/(\s+)?.$/, '')
                         if(mouse.button & Qt.RightButton)
                         {
                           if(entry.text != history[history.length - 1])
                           {
                                 history.push(entry.text);
                                 history_pos++;
                           }
                           mouseArea.opacity = 1;
                           mouseArea.color = Theme.accentColor;
                           mouseArea.createTapCircle(calculator.width - Units.dp(50),0);
                           timer1.running = true;
                           timer2.running = true;
                         }
                    }
                    onPressAndHold :{
                        if(entry.text != history[history.length - 1])
                        {
                              history.push(entry.text);
                              history_pos++;
                        }
                        mouseArea.opacity = 1;
                        mouseArea.color = Theme.accentColor;
                        mouseArea.createTapCircle(calculator.width - Units.dp(50),0);
                        timer1.running = true;
                        timer2.running = true;
                    }
                }
            }
            Icon {
                id:menu
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: Units.dp(5)
                width: Units.dp(20)
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
            width: bigsize ? calculator.width * 3 / 8 : Units.dp(150)
            height:  calculator.height * 0.55
            color: calculator.accentchosen
            Row {
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "√"
                        id:b_sqrt
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'sqrt('
                        }
                    }
                    Button {
                        text: "cos"
                        id:b_cos
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'cos('
                        }
                    }
                    Button {
                        text: "acos"
                        id:b_acos
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'acos('
                        }
                    }
                    Button {
                        text: "exp"
                        id:b_exp
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'exp('
                        }
                    }

                }
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "^"
                        id:b_pow
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'pow('
                        }
                    }
                    Button {
                        text: "sin"
                        id:b_sin
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'sin('
                        }
                    }
                    Button {
                        text: "asin"
                        id:b_asin
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'asin('
                        }
                    }
                    Button {
                        text: "ln"
                        id:b_ln
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'ln('
                        }
                    }
                }
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: ","
                        id:b_coma
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_coma.text
                        }
                    }
                    Button {
                        text: "tan"
                        id:b_tan
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'tan('
                        }
                    }
                    Button {
                        text: "atan"
                        id:b_atan
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += 'atan('
                        }
                    }
                    Button {
                        text: 'π'
                        id:b_pi
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: 'white'
                        height: fn.height / 4
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
            y: tr.height
            width: bigsize ? calculator.width * 4 / 8 : Units.dp(200)
            height:  calculator.height * 0.55
            color: "#444345"
            Row {
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "7"
                        id:b_7
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        anchors.horizontalCenter: parent.horizontalCenter
                        textColor: "white"
                        height: fn.height / 4
                        onClicked: {
                            entry.text += b_7.text
                        }
                    }
                    Button {
                        text: "4"
                        id:b_4
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_4.text
                        }
                    }
                    Button {
                        text: "1"
                        id:b_1
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_1.text
                        }
                    }
                    Button {
                        text: "0"
                        id:b_0
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_0.text
                        }
                    }
                }
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "8"
                        id:b_8
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_8.text
                        }
                    }
                    Button {
                        text: "5"
                        id:b_5
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_5.text
                        }
                    }
                    Button {
                        text: "2"
                        id:b_2
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_2.text
                        }
                    }
                    Button {
                        text: "."
                        id:b_dot
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_dot.text
                        }

                    }
                }
                Column {
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "9"
                        id:b_9
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_9.text
                        }
                    }
                    Button {
                        text: "6"
                        id:b_6
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_6.text
                        }
                    }
                    Button {
                        text: "3"
                        id:b_3
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_3.text
                        }
                    }
                    Button {
                        text: "="
                        id:b_go
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked:result.text = Script.Evaluer(entry.text)
                    }
                }
                Column {
                    id: other
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    Button {
                        text: "X"
                        id:b_X
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += entry.varx
                        }
                    }
                    Button {
                        text: "->X"
                        id:b_attrX
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            result.text = Script.Evaluer(entry.text)
                           	entry.varx = result.text
                        }
                    }
                    Button {
                        text: "("
                        id:b_parleft
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            entry.text += b_parleft.text
                        }
                    }
                    Button {
                        text: ")"
                        id:b_parright
                        width: bigsize ? calculator.width / 8 : Units.dp(50)
                        textColor: "white"
                        height: fn.height / 4
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
            y:tr.height
            width: bigsize ? calculator.width / 8 : Units.dp(50)
            height:  calculator.height * 0.55
            color: "#646264"
            Column {
                width: bigsize ? calculator.width / 8 : Units.dp(50)
                height: Units.dp(151)
                Button {
                    text: "+"
                    id:b_plus
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    textColor: "white"
                    height: fn.height / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += b_plus.text
                    }
                }
                Button {
                    text: "-"
                    id:b_minus
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    textColor: "white"
                    height: fn.height / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += b_minus.text
                    }
                }
                Button {
                    text: "×"
                    id:b_cross
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    textColor: "white"
                    height: fn.height / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        entry.text += '*'
                    }
                }
                Button {
                    text: "÷"
                    id:b_div
                    width: bigsize ? calculator.width / 8 : Units.dp(50)
                    textColor: "white"
                    height: fn.height / 4
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
        NavigationDrawer {
            id:drawer
            width: Units.dp(230)
            z:2
            mode: "right"
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
                        onCheckedChanged: {
                             calculator.bigsize = sw_bigsize.checked
                             drawer.close()
                        }
                        anchors {
                            right: parent.right
                            rightMargin:Units.dp(20)
                            verticalCenter:parent.verticalCenter
                        }
                    }
                }
                ListItem.Standard {
                    id:themechooser
                    text: 'Select AccentColor'
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            colorPicker.show();
                            drawer.close();
                       }
                    }
                }
                ListItem.Standard {
                    text: 'Clear History'
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            history = [];
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
            function open()
            {
              drawer.showing = true;
              shadow_drawer.opacity = 1;
              calculator.x += 1;
            }
            function close()
            {
              drawer.showing = false;
              shadow_drawer.opacity = 0;
               calculator.x += 1;
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
                columns: bigsize ? 7 : 6
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
