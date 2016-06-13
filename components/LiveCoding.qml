/*
 * Copyright (C) 2013 Andrea Bernabei <and.bernabei@gmail.com>
 * Updated/hacked again in 2016 for the QtDay 2016 talk
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */


import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.0

Rectangle {
    id: root

    color: "white"
    width: parent.width
    height: parent.height

    property var oldItem
    property var newItem

    property alias text: txt.text

    function toggleState() {
        state = (state === "hidden" ? "shown" : "hidden")
    }

    Keys.enabled: true
    Keys.onPressed: {
        switch (event.key) {
        case Qt.Key_Plus:
            txt.font.pointSize++
            break;
        case Qt.Key_Minus:
            txt.font.pointSize--
            break;
        case Qt.Key_L:
            toggleState()
        }
        event.accepted = true
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.forceActiveFocus()
    }

    SplitView {
        anchors.fill: parent

        Item {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Layout.preferredWidth: parent.width * 2/3
            Layout.fillWidth: true

            Button {
                id: btn
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                text: "Update LiveItem"
                onClicked: {
                    txt.qmlError = false
                    try {
                        newItem = Qt.createQmlObject(txt.text, compItem, "LiveCodingItem")
                    }
                    catch (err) {
                        txt.qmlError = true
                        errorTxt.text = ""
                        for (var i=0; i<err.qmlErrors.length; i++) {
                            var errorString = "Line " + err.qmlErrors[i].lineNumber + ": " +
                                    err.qmlErrors[i].message + "\n"
                            errorTxt.text += errorString
                        }
                    }

                    if (!txt.qmlError) errorTxt.text = "No errors"

                    if (oldItem) oldItem.destroy()

                    if (newItem) {
                        oldItem = newItem
                    }
                }
            }

            TextArea {
                id: txt
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: btn.bottom
                anchors.bottom: errorBox.top
                clip: true
                wrapMode: TextEdit.Wrap
                textFormat: Text.PlainText
                font.family: "Monospace"

                property bool qmlError: false
                property int oldCursorPosition: 0
                property int currentLine: 0
                onCursorPositionChanged: {
                        cursorRect.x = txt.cursorRectangle.x
                        cursorRect.y = txt.cursorRectangle.y
                        stars.burst(5);
                    txt.currentLine = txt.countNewLinesBetween(0, txt.cursorPosition)
                }

                function countNewLinesBetween(start, end) {
                    return txt.text.substring(start, end).split('\n').length
                }

                Rectangle {
                    id: cursorRect
                    color: "white"
                    height: txt.cursorRectangle.height
                    width: txt.cursorRectangle.width
                }

                ParticleSystem {
                    id: particles
                }

                ImageParticle {
                    id: star
                    system: particles
                    anchors.fill: parent
                    groups: ["A"]
                    source: "../assets/star.png"
                    colorVariation: 100
                    color: "blue"
                }

                Emitter {
                     id: stars
                     group: "A"
                     system: particles
                     anchors.fill: cursorRect
                     lifeSpan: 800
                     velocity: PointDirection { yVariation: 100; xVariation: 100 }
                     acceleration: PointDirection { xVariation: 100; yVariation: 100 }
                     size: 40
                     sizeVariation: 20
                     endSize: 60
                     emitRate: 25
                     enabled: false
                 }

                Rectangle {
                    color: "lightgray"
                    radius: 5
                    width: lineTxt.width + 20
                    height: lineTxt.height + 20
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 10
                    Text {
                        id: lineTxt
                        anchors.centerIn: parent

                        text: "Line: " + txt.currentLine
                    }
                }
            }

            Rectangle {
                id: errorBox
                color: "lightgray"
                radius: 10
                height: 100
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                Flickable {
                    id: flickTxt
                    anchors.fill: parent
                    anchors.margins: 10
                    contentHeight: errorTxt.height
                    contentWidth: errorTxt.width
                    flickableDirection: Flickable.VerticalFlick
                    clip: true

                    Text {
                        id: errorTxt
                        width: flickTxt.width
                        wrapMode: Text.Wrap
                    }
                }
            }
        }

        Rectangle {
            id: compItem
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Layout.preferredWidth: parent.width/3
            //it seems preferredWidth is not enough to specify the initial width
            width: parent.width/3
        }
    }
}
