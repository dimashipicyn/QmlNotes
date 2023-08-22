import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.14

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 600
    title: "Notes"

    Column {
        spacing: 5
        width: parent.width - 20
        height: parent.height - 20
        anchors.centerIn: parent

        TextField {
            id: noteName
            width: parent.width
            placeholderText: qsTr("Name")

            background: Rectangle {
                anchors.fill: parent
                color: "light grey"
                radius: 5
            }

            font.pointSize: 20
        }

        ScrollView {
            width: parent.width
            height: 200
            TextArea {
                id: noteInput
                width: parent.width
                height: parent.height
                placeholderText: qsTr("Write note")
                wrapMode: TextEdit.WordWrap
                font.pointSize: 15
            }

            background: Rectangle {
                anchors.fill: parent
                color: "light grey"
                radius: 5
            }
        }
        
        Button {
            width: parent.width
            text: qsTr("Add note")
            background: Rectangle {
                anchors.fill: parent
                color: "light blue"
                radius: 5
            }
            onClicked: {
                if (noteInput.text != "") {
                    noteModel.addNote(noteName.text, noteInput.text);
                    noteInput.text = "";
                    noteName.text = "";
                }
            }
        }

        Rectangle {
            id: spacer
            width: parent.width
            height: 1
            color: "light grey"
        }

        ScrollView {
            width: parent.width
            height: 290

            ListView {
                id: notesView
                model: noteModel
                spacing: 5
                clip: true

                delegate: Rectangle {
                    width: parent.width
                    height: 60
                    radius: 10
                    color: "light grey"

                    Column {
                        anchors.fill: parent
                        spacing: 10
                        
                        Text {
                            topPadding: 10
                            leftPadding: 10
                            text: name
                            font.bold: true
                        }

                        Text {
                            leftPadding: 10
                            text: {
                                body.slice(0, 30) + (body.length > 30 ? "..." : "");
                            }
                        }
                    }

                    MouseArea {
                        id: contextMenuArea
                        width: parent.width
                        height: 40

                        onPressAndHold: {
                            contextMenu.open()
                            contextMenu.noteIndex = index
                        }
                    }
                }


            }
        }

        Menu {
            id: contextMenu
            width: 120
            anchors.centerIn: parent

            property int noteIndex

            MenuItem {
                text: "Edit Note"
                onTriggered: {
                    editNoteDialog.open(contextMenu.noteIndex)
                }
            }
            MenuItem {
                text: "Delete"
                onTriggered: {
                    noteModel.remove(contextMenu.noteIndex)
                }
            }

            background: Rectangle {
                color: "light gray"
                radius: 5
                border.width: 1
            }
        }
    }

    ListModel {
        id: noteModel

        function addNote(name: String, body: String) {
            noteModel.insert(0, { name: name, body: body });
        }
    }
}
