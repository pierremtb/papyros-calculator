import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import Qt.labs.settings 1.0

Dropdown {
                id:accent_chooser_palette
                width: units.dp(200)
                height: units.dp(200)
                ListItem.Header {
                    text: "Palette"
                }
                Rectangle {
                    id: samples
                    anchors.fill: parent
                    anchors.topMargin: 30
                    color: 'transparent'
                    Column {
                        anchors.centerIn:parent
                        spacing:10
                        Row {     
                            spacing:10
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: '#795548'
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#F44336"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#E91E63"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#9C27B0"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                    
                        }
                    
                    Row {     
                            spacing:10
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#673AB7"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#3F51B5"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#2196F3"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#03A9F4"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                    
                        }
                        Row {     
                            spacing:10
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#00BCD4"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#009688"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#4CAF50"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#FFEB3B"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                    
                        }
                        Row {     
                            spacing:10
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#8BC34A"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#FF9800"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#FF5722"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                            Rectangle {
                                width:25
                                height:25
                                radius: width*0.5
                                color: "#9E9E9E"
                                MouseArea {
                                    anchors.fill: parent
                                    onPressed: {
                                        accent_chooser_palette.close();
                                        accentcolor_sample.color = parent.color
                                    }
                                }
                            }
                    
                        }
                        }
                }
                
            }