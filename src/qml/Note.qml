import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
	id: note
	padding: 5

	header: NotesToolBar {
		onBackButtonClicked: mainStackView.pop()
	}

	Column {
		anchors.fill: parent
		spacing: 5

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
			height: parent.height - noteName.height - addNoteButton.height - 10
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
			id: addNoteButton
			width: parent.width
			text: qsTr("Add note")
			background: Rectangle {
				anchors.fill: parent
				color: "light blue"
				radius: 5
			}
			onClicked: {
				if (noteInput.text != "") {
					mainWindow.notesModel.addNote(noteName.text, noteInput.text);

					mainStackView.pop()
				}
			}
		}
	}
}