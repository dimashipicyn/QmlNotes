import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
	id: page
	padding: 5

	header: NotesToolBar {
		backButton.visible: false
		name.text: "Notes"
		width: page.width
	}

	ScrollView {
		anchors.fill: parent

		ListView {
			id: notesView
			model: mainWindow.notesModel
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
						console.log(index)
					}
				}
			}


		}
	}

	RoundButton {
		id: newNoteButton
		x: parent.width - 70
		y: parent.height - 70

		text: "+"
		palette.button: "light blue"

		onClicked: {
			mainStackView.push("Note.qml");
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
				mainWindow.notesModel.remove(contextMenu.noteIndex)
			}
		}

		background: Rectangle {
			color: "light grey"
			radius: 5
			border.width: 1
		}
	}

	ListModel {
		id: notesModel
		function addNote(name: String, body: String) {
			insert(0, { name: name, body: body });
			console.log('added Note');
		}
	}
}