import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import "script.js" as Script

ApplicationWindow {
    id: calculator
    width:329
    height:275
    theme {
        accentColor: "#009688"
        primaryColor: "#009688"
    }

initialPage: ee  
Page {
        id: ee
        title: "Calculator"
        actionBar.hidden: true
         actions: [
            Action {
               
            },

            Action {
               
                name: "Search"
            },

            Action {
                iconName: "action/home"
                name: "Simple Mode"
            },
            Action {
                iconName: 'communication/clear_all'
                name: "About"
            }
        ]


    Item {

    id:tr
    x:0
    y:5
    width:329
    height:90

     View {
        anchors {
            fill: parent
            margins: units.dp(6)
        }


        TextInput {
            id:entry
            anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 5
            text:' '
            color:'#757575'
        }
        Text {
        id:result
            anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 5
            text:' '
            color:'#212121'
            font.pointSize: 18;
        }
    }
}
        Rectangle {
                
                 id: pa
            x:0
            y:110
             width: 125
             height: 200

            color: Theme.accentColor

                Column {
                     x:-5
                    y:0
                     width: 50
                    height: 200

                
                    Button {
                        text: "DEL"
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_del
                            anchors.fill: parent

                            onPressed: {
                                entry.text = ''
                            }
                        }
                    }
                    Button {
                        text: "cos"
                        id:b_cos
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_cos
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'cos('
                            }
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
                        MouseArea {
                            id: ma_exp
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'exp('
                            }
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
                        MouseArea {
                            id: ma_pow
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'pow('
                            }
                        }
                    }
                   
                    Button {
                        text: "sin"
                        id:b_sin
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_sin
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'sin('
                            }
                        }
                    }
                    Button {
                        text: "asin"
                        id:b_asin
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_asin
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'asin('
                            }
                        }
                    }
                Button {
                        text: "ln"
                        id:b_ln
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_ln
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'ln('
                            }
                        }
                    }
                }
                Column {
                     x:80
                    y:0
                     width: 50
                    height: 200

                
                    Button {
                        text: "√"
                        id:b_sqrt
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_sqrt
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'sqrt('
                            }
                        }
                    }
                    Button {
                        text: "tan"
                        id:b_tan
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_tan
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'tan('
                            }
                        }
                    }
                    Button {
                        text: "atan"
                        id:b_atan
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_atan
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'atan('
                            }
                        }
                    }
                    Button {
                        text: "π"
                        id:b_pi
                        width: units.dp(50)
                        textColor: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_pi
                            anchors.fill: parent

                            onPressed: {
                                entry.text += 'pi'
                            }
                        }
                    }
                
                }

            }

        Rectangle {
                
                 id: page
            x:125
            y:110
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
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_7
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_7.text
                            }
                        }
                    }
                    Button {
                        text: "4"
                        id:b_4
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_4
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_4.text
                            }
                        }
                    }
                    Button {
                        text: "1"
                        id:b_1
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_1
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_1.text
                            }
                        }
                    }
                    Button {
                        text: "0"
                        id:b_0
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_0
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_0.text
                            }
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
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_8
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_8.text
                            }
                        }
                    }
                    Button {
                        text: "5"
                        id:b_5
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_5
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_5.text
                            }
                        }
                    }
                    Button {
                        text: "2"
                        id:b_2
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_2
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_2.text
                            }
                        }
                    }
                Button {
                        text: "."
                        id:b_dot
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_dot
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_dot.text
                            }
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
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_9
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_9.text
                            }
                        }
                    }
                    Button {
                        text: "6"
                        id:b_6
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_6
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_6.text
                            }
                        }
                    }
                    Button {
                        text: "3"
                        id:b_3

                        width: units.dp(50)
                       textColor: "#9c9d9e"

                        anchors.horizontalCenter: parent.horizontalCenter

                        MouseArea {
                            id: ma_3
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_3.text
                            }
                        }
                    }
                Button {
                        text: ","
                        id:b_coma
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_coma
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_coma.text
                            }
                        }
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
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_X
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_X.text
                            }
                        }
                    }
                    Button {
                        text: "->X"
                        id:b_attrX
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_attrX
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_attrX.text
                            }
                        }
                    }
                    Button {
                        text: "("
                        id:b_parleft

                        width: units.dp(50)
                       textColor: "#9c9d9e"

                        anchors.horizontalCenter: parent.horizontalCenter

                        MouseArea {
                            id: m_parleft
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_parleft.text
                            }
                        }
                    }

                Button {
                        text: ")"
                        id:b_parright
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_parright


                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_parright.text
                            }
                        }
                    }
                }
            }

        Rectangle {
                
                 id: pag
            x:290
            y:110
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
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_plus
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_plus.text
                            }
                        }
                    }
                    Button {
                        text: "-"
                        id:b_minus
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_minus
                            anchors.fill: parent

                            onPressed: {
                                entry.text += b_minus.text
                            }
                        }
                    }
                    Button {
                        text: "×"
                        id:b_cross
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_cross
                            anchors.fill: parent

                            onPressed: {
                                entry.text += '*'
                            }
                        }
                    }
                Button {
                        text: "÷"
                        id:b_div
                        width: units.dp(50)
                        textColor: "#9c9d9e"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            id: ma_div
                            anchors.fill: parent

                            onPressed: {
                                entry.text += '/'
                            }
                        }
                    }
                }
            }
            ActionButton {
                id:go
                x:268
                y:88
                width:40
                height:40
                iconName: "editor/equal"
                MouseArea {
                            id: ma_go
                            anchors.fill: parent

                            onPressed: {
                                result.text = Script.Evaluer(entry.text)
                                                   }
                            }
            }

}
}