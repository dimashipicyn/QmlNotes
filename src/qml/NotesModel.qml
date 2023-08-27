import QtQuick 2.12

ListModel {
	id: notesModel
	function addNote(name: String, body: String) {
		insert(0, { name: name, body: body });
		console.log('added Note');
	}
}