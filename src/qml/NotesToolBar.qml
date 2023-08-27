import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.14

ToolBar {
	id: toolbar

	property alias backButton: backButton
	property alias name: name
	property alias menuButton: menuButton

	signal backButtonClicked()
	signal menuButtonClicked()

	Item {
		anchors.fill: parent

		ToolButton {
			id: backButton
			anchors.left: parent.left
			
			text: qsTr("‹")
			font.pointSize: 15
			
			onClicked: backButtonClicked()
		}

		Label {
			id: name
			anchors {
				horizontalCenter: parent.horizontalCenter
				verticalCenter: parent.verticalCenter
			}

			text: qsTr("Name")
			elide: Label.ElideRight
			
			horizontalAlignment: Qt.AlignHCenter
			verticalAlignment: Qt.AlignVCenter


			font.pointSize: 15
		}

		ToolButton {
			id: menuButton
			text: qsTr("⋮")
			font.pointSize: 15

			anchors.right: parent.right
			
			onClicked: menuButtonClicked()
		}
	}
}