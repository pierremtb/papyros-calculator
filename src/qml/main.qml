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

import QtQuick 2.4
import Material 0.1
import Material.ListItems 0.1 as ListItem
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.3 as Controls
import "qrc:/js/script.js" as Script
import QtQuick.Window 2.1
import Qt.labs.settings 1.0

ApplicationWindow {
    id: calculator
    visible: true
    title: 'Calculator'
    property bool bigsize: true
    property string accentchosen: "#E91E63"
    property var history: []
    property var history_pos: history.length - 1
    height: Units.dp(300)
    minimumHeight:  Units.dp(200)
    width: bigsize ? Units.dp(400) : Units.dp(247)
    minimumWidth: bigsize ? Units.dp(280): Units.dp(247)
	  maximumWidth: bigsize ? 99999999 : Units.dp(247)
    onWidthChanged: drawer.close()
    theme {
        accentColor: accentchosen
        primaryColor: "#009688"
    }
    Settings {
        id: settings
        property alias x: calculator.x
        property alias y: calculator.y
        property alias width: calculator.width
        property alias height: calculator.height
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
            height: calculator.height * 0.4
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
                    selectionColor: accentchosen
                    selectedTextColor: "white"
                    wrapMode: TextInput.WrapAnywhere
                    width: calculator.width - Units.dp(60)
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: Units.dp(8)
                    text:history[history_pos]
                    font.pointSize: entry.text.length < 20 ? 18 : 13
                    onTextChanged: {
                        result.text = Script.Evaluer(entry.text);
                        //result.text = MathJS.eval(entry.text);
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
                    font.pointSize: getResultGoodFontSize()
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
            height:  calculator.height * 0.60
            color: calculator.accentchosen
            Grid {
                id:fns
                columns:3
                rows:4
                property var labels: ["√","^",",","cos","sin","tan","acos","asin","atan","exp","ln","pi"]
                property var targets: ["sqrt(","pow(",",","cos(","sin(","tan(","acos(","asin(","atan(","exp(","ln(","pi"]
                Repeater {
                    model: fns.labels
                    CalculatorButton {
                        label: modelData
                        target: fns.targets[index]
                        fontSize:getButtonsGoodFontSize()-3
                    }
                }
            }
        }
        Rectangle {
            id: num
            x: bigsize ? fn.width : 0
            y: tr.height
            width: bigsize ? calculator.width * 4 / 8 : Units.dp(200)
            height:  calculator.height * 0.6
            color: "#444345"
            Grid {
                id:nums
                columns:4
                rows:4
                property var labels: ["7","8","9","X","4","5","6",">X","1","2","3","(","0",".","=",")"]
                property var targets: ["7","8","9","X","4","5","6",">X","1","2","3","(","0",".","=",")"]
                Repeater {
                    model: nums.labels
                    CalculatorButton {
                        label: modelData
                        target: nums.targets[index]
                        fontSize:getButtonsGoodFontSize()
                    }
                }
            }
        }
        Rectangle {
            id: signs
            x:bigsize ? fn.width + num.width : fn.width + Units.dp(50)
            y:tr.height
            width: bigsize ? calculator.width / 8 : Units.dp(50)
            height:  calculator.height * 0.6
            color: "#646264"
            Column {
                id:signss
                property var labels: ["+","-","*","/"]
                property var targets: ["+","-","*","/"]
                Repeater {
                    model: signss.labels
                    CalculatorButton {
                        label: modelData
                        target: signss.targets[index]
                        fontSize:getButtonsGoodFontSize()
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
            z:-10
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
            MouseArea {
              anchors.fill: parent
              onPressed: drawer.close()
            }
        }
        NavigationDrawer {
            id:drawer
            width: Units.dp(230)
            z:25
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
                             //calculator.width = bigsize ? Units.dp(400) : Units.dp(247)
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
              shadow_drawer.z=20;
              calculator.x += 1;
			  calculator.x -= 1;
            }
            function close()
            {
              drawer.showing = false;
              shadow_drawer.z=-10;
              shadow_drawer.opacity = 0;
               calculator.x += 1;
			   calculator.x -= 1;
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
    function getButtonsGoodFontSize()
    {
        if(calculator.width > Units.dp(800) && calculator.height > Units.dp(600))
            return 35;
        else if(calculator.width > Units.dp(700) && calculator.height > Units.dp(500))
            return 31;
        else if(calculator.width > Units.dp(600) && calculator.height > Units.dp(300))
            return 27;
        else if(calculator.width > Units.dp(500))
            return 23;
        else if(calculator.width > Units.dp(370))
            return 19;
        else
            return 15;
    }

    function getResultGoodFontSize()
    {
      if(calculator.width > Units.dp(800) && calculator.height > Units.dp(600))
      {
        if(result.text.length > 15)
            return Units.dp(57);
        else if(result.text.length > 10)
            return Units.dp(60);
        else
            return Units.dp(80);
      }
      else if(calculator.width > Units.dp(700) && calculator.height > Units.dp(400))
      {
        if(result.text.length > 15)
            return Units.dp(47);
        else if(result.text.length > 10)
            return Units.dp(50);
        else
            return Units.dp(70);
      }
      else if(calculator.width > Units.dp(600) && calculator.height > Units.dp(300))
      {
        if(result.text.length > 15)
            return Units.dp(35);
        else if(result.text.length > 10)
            return Units.dp(40);
        else
            return Units.dp(50);
      }
      else
      {
        if(bigsize && result.text.length > 15)
            return Units.dp(18);
        else if(bigsize && result.text.length > 10)
            return Units.dp(25);
        else if(bigsize)
            return Units.dp(29);
        else if(!bigsize && result.text.length > 15)
            return Units.dp(12);
        else if(!bigsize && result.text.length > 10 )
            return Units.dp(17)
        else
            return Units.dp(25)
        }
    }
}
