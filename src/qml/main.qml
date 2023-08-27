import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.14

ApplicationWindow {
	id: mainWindow
	visible: true
	width: 400
	height: 600
	title: "Notes"

	property ListModel notesModel: NotesModel {}

	StackView {
		id: mainStackView
		anchors.fill: parent

		initialItem: Notes {
			
		}
	}
}
