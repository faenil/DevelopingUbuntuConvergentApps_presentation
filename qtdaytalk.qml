/****************************************************************************
**
** Copyright (C) 2016 Andrea Bernabei
** Contact: Andrea Bernabei <andrea.bernabei@canonical.com>
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
**
****************************************************************************/

import QtQuick 2.4

//useful to get autocompletion in QtCreator without having to install the library system-wide
import "./qt-labs-qml-presentation-system/examples/tutorial"
import "./qt-labs-qml-presentation-system/src"

import "./components"

Presentation
{
    id: presentation

    //1.4 ratio, So that it fills the A4 pdf that QPrinter will use to print to file
    //but it must still fit in my lowres screen or part of the slides will not be printed to file
    //hence the low res
    width: 959
    height: 678

    showNotes: true
    titleColor: slides[currentSlide].useUbuntuBackground ? "#ffffff" : "#5d5d5d"
    textColor: slides[currentSlide].useUbuntuBackground ? "#ffffff" : "#666666"

    Keys.onPressed: if (event.key === Qt.Key_L) {
                        liveCodingArena.toggleState()
                    }

    //ubuntu orange background
    Rectangle {
        anchors.fill: parent
        color: "#E95420"
        visible: slides[currentSlide].useUbuntuBackground
    }

//    SlideCounter {}
//    Clock {}

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Convergent Qt applications for Ubuntu"
        subtitle: "\nAndrea Bernabei, UX Engineer @ Canonical"
    }

    Slide {
        contentWidth: width
        title: "Before we begin"
        content: [
            "This presentation is written in QML (it's basically an app!)",
            "If you're reading the PDF version, make sure you also check out the QML version",
            " it includes a livecoding environment with code samples!",
            " it has higher rendering quality",
            " <b>https://github.com/faenil/DevelopingUbuntuConvergentApps_presentation</b>"
        ]
    }
    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "About me"
        subtitle: "Let me tell you a story..."
    }

    Slide {
        title: "About me: Andrea Bernabei, a.k.a <b>faenil</b>"
        content: [
            "Joined Canonical as <b>UX Engineer</b> in March 2015",
            " right after getting my Master's degree in Computer Science",
            " a <b>developer</b>, member of Design Team!",
            " C++ UI components and QML prototyping",
            "Passionate about software development",
            " and communities...and tinkering! :)",
            "1 year in Canonical",
            " London HQ",
        ]

        Image {
            anchors.left: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/2
            fillMode: Image.PreserveAspectFit
            source: "assets/me.jpg"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Ubuntu for Devices"
        subtitle: "A fully scalable OS"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        subtitle: "A fully scalable OS"

        Image {
            anchors.fill: parent
            source: "assets/ubuntu_platforms.png"
            fillMode: Image.PreserveAspectFit
        }

        notes: "70% of public cloud workloads\n
                55% of OpenStack clouds run on Ubuntu."
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Road to convergence"
        subtitle: "The future of personal computing"
    }

    Slide {
        title: "Everything you need from a PC...in a tablet"

        notes: "Effortless multitasking and window management\n
Desktop applications and thin client support for mobility and productivity\n
Responsive, adaptive applications developed for both touch and point/click input\n
Single application store with a range of compatible 3rd party services\n
Communication from the desktop interface using the phone’s telephony and messaging applications\n
"
        Image {
            anchors.fill: parent
            source: "assets/tablet-overview-convergence.jpg"
            fillMode: Image.PreserveAspectFit
        }
    }

    Slide {
        title: "The converged experience"

        notes: "The journey towards OS convergence begins with Unity 8\n
Unique proposition: a single, visual framework and toolset for applications to run on any Ubuntu smart device\n
Desktop application developers can use the SDK to extend their apps for mobile\n
Third party developers can easily create new Ubuntu apps which only need to be developed once and run everywhere
"
        Image {
            anchors.fill: parent
            source: "assets/tablet-features-pc.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Slide {
        title: "The converged experience"
        Image {
            anchors.fill: parent
            source: "assets/music_convergence.jpg"
            fillMode: Image.PreserveAspectFit
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Ubuntu SDK"
        subtitle: "The heart of apps development"
    }

    Slide {
        contentWidth: width
        useUbuntuBackground: true
        title: "Entry points for developers"
        content: [
            "Scopes",
            " we'll give a quick overview...",
            "Webapps",
            " a quick overview...",
            "<b>Qt/QML apps. \\o/</b>",
            " the real deal, the best and most future-proof framework to build convergent apps"
        ]
    }

    Slide {
        title: "Scopes"
        content: [
            "Shifting away from the apps grid",
            "Like individual homescreens",
            " for different kind of contents",
            "Life at your fingertips",
            "Can be implemented in C++, JS, or Go!"
        ]
        notes: "no need to open apps\n
                quicker access to content\n
                unified and coherent style"
        Image {
            anchors.left: parent.horizontalCenter
            width: parent.width/2
            fillMode: Image.PreserveAspectFit
            source: "assets/scopes-row.jpg"
        }
    }

    Slide {
        title: "Scopes: data flow"
        Image {
            anchors.fill: parent
            source: "assets/scopes-data-flow.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "HTML5 Apps"
        subtitle: "using Cordova API"
    }

    Slide {
        title: "HTML5 Apps: Cordova"
        content: [
            "Apps run in web container",
            " Chromium-powered (Oxide)",
            " Isolated cookies/history",
            " 509/555 score at html5test.com",
            "Ubuntu is an official Cordova platform!",
            "Familiar toolset for existing Cordova/Phonegap devs",
            " More info on Cordova's website: see goo.gl/27pgHY",
        ]
        Column {
            //hacky hacky
            x: parent.width * 3/4 - childrenRect.width/2
            height: parent.height
            Image {
                height: parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "assets/cordova.png"
            }
            Image {
                height: parent.height/2
                fillMode: Image.PreserveAspectFit
                source: "assets/ubuntu.png"
            }
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Native apps"
        subtitle: "Powered by Qt/QML"
    }

    Slide {
        title: "Native apps: Qt/QML"
        content: [
            "Full native OpenGL",
            "The power and the simplicity of QML/JS",
            " plus the efficiency of C++",
            "<b>Convergent</b> Ubuntu UI Toolkit available",
            "Extensive Platform API",
            "<b>Best framework to build first-class convergent apps!</b>"
        ]
        Image {
            anchors.left: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/2
            fillMode: Image.PreserveAspectFit
            source: "assets/qt_logo_green_rgb.svg"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "News about Ubuntu SDK"
        subtitle: "No more chroot problems!"
    }

    Slide {
        title: "Ubuntu SDK Kits: before"
        contentWidth: width
        content: [
            "\"click chroot\" creates a chroot env",
            "Uses <b>debootstrap</b> to create env",
            " slow to create",
            " requires download/install of all packages",
            " breaks often on upgrades (Overlay PPA not checked)",
            "Uses <b>schroot</b> to handle env",
            " starts/resumes a session whenever a cmd is run",
            " sessions not always cleanly exited (bug?)",
            "  mountpoints never released, they accumulate over reboots!",
            " running commands is slow, because of the sessions",
            " session daemon not very reliable",
            "Only one chroot per architecture (and framework)"
        ]
    }

    Slide {
        title: "Ubuntu SDK Kits: now (or, soon!)"
        contentWidth: width
        content: [
            "Now using LXD!",
            " LXD: the Linux container hypervisor",
            " developed by Canonical",
            " LXC-based",
            "  i.e. kernel is shared with the host",
            " super fast, much faster than a VM",
            "  no virtualization overhead!"
        ]

        notes: "hardware virtualization is needed if:
                you need to use a specific kernel, for whatever reason
                you need to use non-linux

                Docker vs LXC:
                Docker is a single application container! No init, restricted to single process
                Docker instances are ephemeral, data has to be saved using bindmounts on the host (or you need a Docker data volume, which is a bindmount to a normal container, adding more complexity)
                LXC container is a proper OS, you can save data in it and is multiprocess"
    }

    Slide {
        title: "Ubuntu SDK Kits: now (or, soon!)"
        contentWidth: width
        content: [
            "LXD containers! \\o/",
            " image based, very fast container creation",
            "Can potentially have one container per app!",
            " to avoid littering other containers with app specific dependencies",
            "No need to run apps on the host system anymore",
            " you can run them from a desktop container instead!",
            "  using the X server from the host",
            "  supports system services and everything",
            "No need to install development tools on the host",
            " the container will hold all what's needed",
        ]
    }


    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "AdaptivePageLayout"
        subtitle: "A convergent dual-page stack"
    }

    Slide {
        title: "AdaptivePageLayout"
        contentWidth: width
        content: [
            "A multiple columns page stack",
            " internally a RowLayout of items",
            " by default shows 1 or 2 columns based on window size",
            " very <b>flexible</b>",
            "  can host multiple column layouts, each with its own sizing properties (min/max size, etc)",
            "  can override the condition that triggers a layout",
            "The columns are user-resizable",
            "Automatic handling of \"back\" button in the headers, where needed",
            "Main methods: <b>addPageToCurrentColumn(sourcePage, newPage)</b>, or <b>addPageToNextColumn(sourcePage, newPage)</b>"
        ]

        notes: "When a Page is added to a virtual column that is not visible, it will instead be shown in the right-most visible column.
                removePages(page) to remove page and all the pages added after that, except primaryPage"

    }

    Slide {
        title: "AdaptivePageLayout: an example"

        Image {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            sourceSize.width: parent.width
            mipmap: true
            source: "assets/adaptivepagelayout.jpg"
            ImgBorderRect {}
        }
    }

    Slide {
        title: "AdaptivePageLayout"
        centeredText: "Livecoding!"
        codeSample: "
import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    anchors.fill: parent

    AdaptivePageLayout {
        id: layout
        anchors.fill: parent
        primaryPage: rootPage

        Page {
            id: rootPage
            title: i18n.tr(\"Root page\")

            Column {
                anchors {
                    top: parent.top
                    left: parent.left
                    margins: units.gu(1)
                }
                spacing: units.gu(1)

                Button {
                    text: \"Add page left\"
                    onClicked: layout.addPageToCurrentColumn(rootPage, leftPage)
                }
                Button {
                    text: \"Add page right\"
                    onClicked: layout.addPageToNextColumn(rootPage, rightPage)
                }
                Button {
                    text: \"Add sections page right\"
                    onClicked: layout.addPageToNextColumn(rootPage, sectionsPage)
                }
            }
        }

        Page {
            id: leftPage
            title: i18n.tr(\"First column\")

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.orange

                Button {
                    anchors.centerIn: parent
                    text: \"right\"
                    onTriggered: layout.addPageToNextColumn(leftPage, rightPage)
                }
            }
        }

        Page {
            id: rightPage
            title: i18n.tr(\"Second column\")

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.green

                Button {
                    anchors.centerIn: parent
                    text: \"Another page!\"
                    onTriggered: layout.addPageToCurrentColumn(rightPage, sectionsPage)
                }
            }
        }

        Page {
            id: sectionsPage
            title: i18n.tr(\"Page with sections\")
            head.sections.model: [i18n.tr(\"one\"), i18n.tr(\"two\"), i18n.tr(\"three\")]

            Rectangle {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }
                color: UbuntuColors.blue
            }
        }
    }
}"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "PageHeader"
        subtitle: "The application header"
    }

    Slide {
        title: "PageHeader"
        contentWidth: width
        content: [
            "Adapts its size to save precious screen estate",
            " shrinks when in landscape on phones",
            "Allows adding an <b>extension</b>",
            "Dynamically hides/shows based on user interaction with the surface",
            "Automatic back button handling when used in PageStack/AdaptivePageLayout",
            " handles multiple columns as well",
            "Supports <b>focus states</b> and <b>keyboard navigation</b>",
            "Time for a demo!"
        ]

        notes: "old application header is hidden when Page.header is set"
    }

    Slide {
        title: "PageHeader: example of a header \nwith header sections (Text, Telegram, WeChat)"
        Image {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "assets/header-sections.png"
            mipmap: true
            ImgBorderRect {}
        }
    }

    Slide {
        title: "PageHeader"
        centeredText: "Livecoding!"
        codeSample: "
import QtQuick 2.4
import Ubuntu.Components 1.3
MainView {
anchors.fill: parent
    Page {
        id: page
        header: standardHeader
        Label {
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: page.header.bottom
                topMargin: units.gu(5)
            }
            text: \"Use the icons in the header.\"
            visible: standardHeader.visible
        }
        PageHeader {
            id: standardHeader
            visible: page.header === standardHeader
            title: \"Default title\"
            trailingActionBar.actions: [
                Action {
                    iconName: \"search\"
                    text: \"Search\"
                    onTriggered: page.header = searchHeader
                },
                Action {
                    iconName: \"edit\"
                    text: \"Edit\"
                    onTriggered: page.header = editHeader
                }
            ]
        }
        PageHeader {
            id: searchHeader
            visible: page.header === searchHeader
            leadingActionBar.actions: [
                Action {
                    iconName: \"back\"
                    text: \"Back\"
                    onTriggered: page.header = standardHeader
                }
            ]
            contents: TextField {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                placeholderText: \"Search...\"
            }
        }
        PageHeader {
            id: editHeader
            visible: page.header === editHeader
            property Component delegate: Component {
                AbstractButton {
                    id: button
                    action: modelData
                    width: label.width + units.gu(4)
                    height: parent.height
                    Rectangle {
                        color: UbuntuColors.slate
                        opacity: 0.1
                        anchors.fill: parent
                        visible: button.pressed
                    }
                    Label {
                        anchors.centerIn: parent
                        id: label
                        text: action.text
                        font.weight: text === \"Confirm\"
                                     ? Font.Normal
                                     : Font.Light
                    }
                }
            }
            leadingActionBar {
                anchors.leftMargin: 0
                actions: Action {
                    text: \"Cancel\"
                    iconName: \"close\"
                    onTriggered: page.header = standardHeader
                }
                delegate: editHeader.delegate
            }
            trailingActionBar {
                anchors.rightMargin: 0
                actions: Action {
                    text: \"Confirm\"
                    iconName: \"tick\"
                    onTriggered: page.header = standardHeader
                }
                delegate: editHeader.delegate
            }
            extension: Toolbar {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                trailingActionBar.actions: [
                    Action { iconName: \"bookmark-new\" },
                    Action { iconName: \"add\" },
                    Action { iconName: \"edit-select-all\" },
                    Action { iconName: \"edit-copy\" },
                    Action { iconName: \"select\" }
                ]
                leadingActionBar.actions: Action {
                    iconName: \"delete\"
                    text: \"delete\"
                    onTriggered: print(\"Delete action triggered\")
                }
            }
        }
    }
}"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Showing content: lists"
        subtitle: "ListItem, ListItemLayout"
    }


    Slide {
        title: "Lists: ListItem"
        contentWidth: width
        content: [
            "C++ internals, <b>16x faster</b> instantiation than the old ListItems.Empty component!",
            "Provides swipable actions: leading and trailing",
            " also via mouse right click",
            "Automatically handles divider",
            " autohides in last element of a list",
            "<b>Drag&amp;Drop</b> is super easy! See <b>ViewItems</b> attached property",
            "<b>Multiselection</b> is super easy! See <b>ViewItems</b> API",
            "Features <b>expansion</b> mode to accomodate additional content",
            "Supports <b>focus states</b> and <b>keyboard navigation</b>",
        ]

        notes: "ViewItems::expansionFlags to handle things like ViewItems.CollapseOutsideOnPress, ViewItems.Exclusive\n
                Expanded ListItem can't be swiped unless ViewItems.UnlockExpanded is set


                Benchmark run on XPS13 with i7-5500U

                Results: about 180ms reusing the same instance of swiping actions (150ms without actions, 200-230ms with inline actions!) VS 3000ms

                Benchmark code:


"

    }

    Slide {
        title: "ListItem: an example of swipable actions"
        Image {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            fillMode: Image.PreserveAspectFit
            source: "assets/listitem-trailing-actions.png"
            mipmap: true
            ImgBorderRect {}
        }
    }

    Slide {
        title: "ListItem"
        centeredText: "Livecoding!"

        codeSample: "
import QtQuick 2.4
import Ubuntu.Components 1.3
ListView {
    anchors.fill: parent
    clip: true
    model: ListModel {
        Component.onCompleted: {
            for (var i = 0; i < 100; i++) {
                append({tag: \"List item #\"+i});
            }
        }
    }

    ViewItems.expansionFlags: ViewItems.CollapseOnOutsidePress

    delegate: ListItem {
        expansion.height: units.gu(15)
        onPressAndHold: ListView.view.ViewItems.dragMode =
            !ListView.view.ViewItems.dragMode
        onClicked: expansion.expanded = !expansion.expanded

        leadingActions: ListItemActions {
            actions: [
                Action {
                    iconName: \"delete\"
                }
            ]
        }

        trailingActions: ListItemActions {
            actions: [
                Action {
                    iconName: \"search\"
                },
                Action {
                    iconName: \"edit\"
                }
            ]
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: modelData
        }
    }
    ViewItems.onDragUpdated: {
        if (event.status == ListItemDrag.Moving) {
            // inform dragging that move is not performed
            event.accept = false;
        } else if (event.status == ListItemDrag.Dropped) {
            model.move(event.from, event.to, 1);
        }
    }
    moveDisplaced: Transition {
        UbuntuNumberAnimation {
            property: \"y\"
        }
    }
}"
    }

    Slide {
        title: "Lists: ListItemLayout"
        contentWidth: width
        content: [
            "C++ internals, QML API, perfect ListItem buddy (<b>ListItem</b> defines <b>swiping actions</b>, <b>ListItemLayout</b> defines the <b>main content</b>!)",
            "<b>ListItem with 4 swiping actions + ListItemLayout holding 3 labels and 3 Items are still 3x quicker to instantiate than old QML ListItems.Empty component (empty!)</b>",
            "Provides automatic padding and positioning for list-items content",
            " following visual rules defined by Design Team",
            " layout is driven by <b>mainSlot</b> (child)",
            "Provides up to 3 labels with predefined styling",
            "Flexible and customizable, covers most of the usecases",
            " dev can tweak both per-child and global paddings",
            " for the rest, see <b>SlotsLayout</b>"
        ]

        notes: "
            Benchmark run on XPS13 with i7-5500U

            Results: 930-970ms vs about 3000ms

            Benchmark code:

ListItemLayout benchmark

import QtQuick 2.0
import Ubuntu.Components 1.3
Column {
    width: 800
    height: 600

    Repeater {
        model: 5000
        ListItem {
            trailingActions: ListItemActions {
                actions: [
                    Action {}
                ]
            }
            leadingActions: ListItemActions {
                actions: [
                    Action {},
                    Action {},
                    Action {}
                ]
            }

            ListItemLayout {
                Item { SlotsLayout.position: SlotsLayout.Leading; width: units.gu(2) }
                Item { SlotsLayout.position: SlotsLayout.Trailing; width: units.gu(2) }
                Item { SlotsLayout.position: SlotsLayout.Trailing; width: units.gu(2) }
                title.text: \"test\"
                subtitle.text: \"label\"
                summary.text: \"new\"
            }
        }
    }
}



ListItems.Empty benchmark

import QtQuick 2.0
import Ubuntu.Components 1.3
Column {
    width: 800
    height: 600
    Repeater {
        model: 5000
        ListItems.Empty {
        }
    }
}



"

    }


    Slide {
        title: "ListItemLayout: examples"

            Image {
                x: parent.width/4 - width/2
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                fillMode: Image.PreserveAspectFit
                source: "assets/listitemlayout-dekko.png"
                mipmap: true
                ImgBorderRect {}
            }

            Image {
                x: parent.width*3/4 - width/2
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                fillMode: Image.PreserveAspectFit
                source: "assets/listitemlayout-systemsettings.jpg"
                mipmap: true
                ImgBorderRect {}
            }

    }

    Slide {
        title: "ListItemLayout"
        centeredText: "Livecoding!"

        codeSample: "
import QtQuick 2.4
import Ubuntu.Components 1.3

ListView {
    anchors.fill: parent
    clip: true

    Column {
        anchors.left: parent.left
        anchors.right: parent.right

        ListItem {
            id: addressbookListItem
            height: addressbookLayout.height + (divider.visible ? divider.height : 0)

            leadingActions: ListItemActions {
                actions: [
                    Action {
                        iconName: \"delete\"
                    }
                ]
            }

            trailingActions: ListItemActions {
                actions: [
                    Action {
                        iconName: \"search\"
                    },
                    Action {
                        iconName: \"edit\"
                    }
                ]
            }

            ListItemLayout {
                id: addressbookLayout
                title.text: \"Address book list item: Name goes here\"

                Rectangle {
                    SlotsLayout.position: SlotsLayout.Leading
                    color: \"pink\"
                    height: units.gu(6)
                    width: height
                    visible: width > 0
                }
            }
        }

        ListItem {
            id: addressbookDetailsListItem
            height: addressbookDetailsLayout.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: addressbookDetailsLayout

                title.text: \"+12 3456789012\"
                subtitle.text: \"Mobile\"

                Icon {
                    name: \"message\"
                    height: units.gu(2)
                }

                Icon {
                    name: \"call-start\"
                    height: units.gu(2)
                }
            }

        }


        ListItem {
            id: telegramContactsListItem

            height: telegramContactsLayout.height + (divider.visible ? divider.height : 0)

            ListItemLayout {
                id: telegramContactsLayout
                title.text: \"Telegram Name goes here\"
                subtitle.text: \"last seen 12:02\"
                summary.text: \"Oh wow! What a nice layout!\"

                Rectangle {
                    id: imageShape
                    SlotsLayout.position: SlotsLayout.Leading
                    height: units.gu(6)
                    width: height
                    color: \"red\"
                }
            }
        }

        ListItem {
            id: systemSettings1
            height: systemSettings1_layout.height + (divider.visible ? divider.height : 0)

            ListItemLayout {
                id: systemSettings1_layout
                title.text: \"Call forwarding\"

                ProgressionSlot {}

                Text {
                    font.pixelSize: FontUtils.sizeToPixels(\"medium\")
                    text: \"Off\"
                    color: \"#525252\"
                }
            }
        }

        ListItem {
            id: systemSettings2
            height: systemSettings2_layout.height + (divider.visible ? divider.height : 0)

            ListItemLayout {
                id: systemSettings2_layout
                title.text: \"Flight mode\"

                Icon {
                    SlotsLayout.position: SlotsLayout.Leading
                    width: units.gu(6);
                    height: units.gu(6);
                    name: \"airplane-mode\"
                }
                Switch { }
            }
        }

        ListItem {
            id: systemSettings3
            height: systemSettings3_layout.height + (divider.visible ? divider.height : 0)

            ListItemLayout {
                id: systemSettings3_layout
                title.text: \"الفيسبوك\"
                subtitle.text: \"الفيسبوك\"

                LayoutMirroring.enabled: true
                LayoutMirroring.childrenInherit: true

                ProgressionSlot {}

                Icon {
                    SlotsLayout.position: SlotsLayout.Leading
                    width: units.gu(6);
                    height: units.gu(6);
                    name: \"facebook\"
                }
            }
        }

        ListItem {
            height: customLabelsLayout.height + (divider.visible ? divider.height : 0)

            ListItemLayout {
                id: customLabelsLayout
                title.text: \"Lorem ipsum...\"
                title.color: \"blue\"
                title.horizontalAlignment: Text.AlignHCenter

                subtitle.text: \"..dolor sit amet, consectetur adipiscing elit...\"
                subtitle.color: \"red\"
                subtitle.horizontalAlignment: Text.AlignHCenter

                summary.text: \"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\" +
                    \"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi\" +
                    \"ut aliquip ex ea commodo consequat.\"
                summary.color: \"green\"
                summary.horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Handling scrollable surfaces"
        subtitle: "ScrollView"
    }

    Slide {
        title: "ScrollView"
        contentWidth: width
        content: [
            "Super easy to use API, just wrap your scrollable item in a ScrollView{...}",
            "3 states: indicator, thumb, steppers (desktop-y)",
            "Active state depends on the input device",
            "Scrolling indicator when using <b>touch</b>",
            "Desktop friendly thumb+steppers when using <b>mouse</b>",
            "Handles scrolling via <b>Keyboard</b> keys"
        ]

        notes: "Add ScrollView to ListItem and ListItemLayout examples, remember to fill parent"
    }

    Slide {
        title: "ScrollView convergence: dynamically adapts between mouse-friendly..."
        Image {
            height: parent.height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/scrollview-pointer.jpg"
            mipmap: true
            ImgBorderRect {}
        }
    }

    Slide {
        title: "...and touch-friendly"
        Image {
            height: parent.height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/scrollview-touch.jpg"
            mipmap: true
            ImgBorderRect {}
        }
    }

    Slide {
        title: "ScrollView"
        centeredText: "Livecoding!"
    }

    Slide {
        title: "More cool stuff"
        contentWidth: width
        content: [
            "Advanced style customization",
            " via <b>StyleHint</b> component",
            "Colour Palette with semantic names",
            "WIP: input devices detection from QML",
            " undergoing security review",
            "Minimum <b>touch</b> area for components deriving from AbstractButton",
            " mouse area not affected!",
            "<b>Mnemonics</b> and <b>shortcut keys</b> handling",
            " via Action component"

        ]
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Verifying your app is convergent"
        subtitle: "Checklist"
    }

    Slide {
        title: "Verifying your app is convergent"
        contentWidth: width
        content: [
            "Make sure your UI scales across different screens and form factors",
            " Use <b>units.gu(val)</b> for sizes, not pixels!",
            " Use Label's textSize to make labels scale beautifully",
            "Handle focus states",
            "Handle keyboard UI navigation (where appropriate)",
            "Consider adding main action to PageHeader instead of using <b>BottomEdgeHint</b> when pointer device is detected"
        ]
    }

    Slide {
        title: "Verifying your app is convergent"
        contentWidth: width
        content: [
            "Tailor UX to different input devices",
            " e.g. don't mix touch and mouse",
            " check out <b>Mouse.ignoreSynthesizedEvents</b> in Ubuntu Components!",
            "Tailor each UX journey to be comfortable to use with the input device that started it",
            " e.g. menus opened via touch should have taller menu items than menus opened via mouse",
            " NOTE: the menu should keep touch-friendly UI until it's closed and then reopened via another device"
        ]
    }

    Slide {
        title: "Convergent UX: popover - touch"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/popover_touch.png"
            mipmap: true
        }
    }
    Slide {
        title: "Convergent UX: popover - pointer"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/popover_pointer.png"
            mipmap: true
        }
    }

    Slide {
        title: "Convergent UX: indicators - touch"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/indicator_location_touch.png"
            mipmap: true
        }
    }
    Slide {
        title: "Convergent UX: indicators - pointer"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/indicator_location_pointer.png"
            mipmap: true
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "The future of Ubuntu SDK"
        subtitle: "Roadmap"
    }

    Slide {
        title: "The future of Ubuntu SDK"
        contentWidth: width
        content: [
            "Priority to improvement of app startup time",
            " by optimizing components logic",
            "Continue conversion of components logic to C++",
            " faster than QML",
            "Move Click chroots to LXD",
            " Finally! No more schroot issues!",
            " Coming <b>soon!</b>",
            "Planning UITK 2.0",
            " consider rebasing on QtQuickControls 2.0",
            "Keep adding convergent features to components",
            " improve focus states handling",
            " improve keyboard navigation"
        ]
    }

    Slide {
        title: "The future of Ubuntu SDK"
        subtitle: "Roadmap"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/sdk_roadmap.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Frameworks"
        subtitle: "Targeting APIs"
    }

    Slide {
        title: "Frameworks"
        contentWidth: width
        content: [
            "A \"contract\" between app and platform",
            " \"My app needs this API\"",
            "Version of Ubuntu on your laptop != version of the framework",
            " 14.04 laptop can target 15.04 framework",
            "  thanks to SDK's Device Kits",
            "At the end of the day: mainly used as a way to filter apps at Store level."
        ]

        notes: "When new FW appears -> not forced to update: successive framework versions coexist \n
                Can target newer FW than the Ubuntu your laptop is running -> SDK uses Device Kits"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Beyond UI Components..."
        subtitle: "Integrating with the platform"
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Security at its core"
        subtitle: "AppArmor"
    }

    Slide {
        title: "AppArmor"
        contentWidth: width
        content: [
            "Apps run in a restricted sandbox",
            "Can only access its own data",
            " and import content from other apps via ContentHub",
            "Cannot access Priviledged APIs (Telepathy, etc)",
            "Can request user permission to access APIs such as Location and Online Accounts",
            " IMPORTANT: user gets security prompt in-context (not at installation time)"
        ]

    }

    Slide {
        title: "AppArmor: API access"
        contentWidth: width
        content: [
            "Opt-in API:",
            " requires user-permission",
            " use app's manifest to specify what you need",
            " examples: accounts, audio, mic, location, camera, sensors, content_exchange...",
            "Reserved API:",
            " requires manual review in Store",
            " calendar, contacts, sms/calls history...",
            " mostly used by Core apps"
        ]

        notes: "gconf blocked by default\n
                gsettings same\n
                dbus: can only access what is linked to policy groups, rest is blocked\n
                can't create alternative sms/contacts app ATM\n
                why not LXC/Docker? see AppAmor confinement webpage, it has Q/A"
    }

    Slide {
        title: "AppArmor: filesystem access"
        contentWidth: width
        content: [
            "Apps have R/W access to:",
            " XDG_CACHE_HOME/&lt;APP_PKGNAME&gt;\n",
            " XDG_CONFIG_HOME/&lt;APP_PKGNAME&gt;\n",
            " XDG_DATA_HOME/&lt;APP_PKGNAME&gt;\n",
            " XDG_RUNTIME_DIR/&lt;APP_PKGNAME&gt;\n",
            " XDG_RUNTIME_DIR/confined/&lt;APP_PKGNAME&gt; (for TMPDIR)",
            "All paths exposed via QStandardPaths"
        ]

        notes: "APPK_PKGNAME defined in the manifest and in MainView on QML side"
    }

    Slide {
        title: "AppArmor: summary"

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/apparmor_scheme.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Sharing content between apps"
        subtitle: "The Content Hub"
    }

    Slide {
        title: "Sharing content: the Content Hub"

        content: [
            "Every piece of content is owned by an app",
            " no single app owns everything",
            "Each content type has a default app",
            "Apps register as source or destination for a content type",
            " using app's manifest"
        ]
        Image {
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: parent.width/4 - width/2
            height: parent.height
            source: "assets/contentHub.png"
            fillMode: Image.PreserveAspectFit
        }

        notes: "app can import and discard\n
                or import and save (copy)\n
                Use ContentStore API to save imported content\n
                if you're a source -> implement ContentHub callback that will be called when apps want to import\n
                an app which is ready to export sets state to Charged, ContentHub does the rest"
    }

    Slide {
        title: "Sharing content: the Content Hub"

        content: [
            "Content Hub handles the UI and actual transfer of data",
            "Imported content is discarded after use by default",
            " use ContentStore API to save it",
            "Don't forget to add AppArmor policy (content_exchange, content_exchange_source)"
        ]
        Image {
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: parent.width/4 - width/2
            height: parent.height
            source: "assets/contentHub.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Multitasking"
        subtitle: "Handling your application lifecycle"
    }

    Slide {
        title: "Handling your application lifecycle"
        contentWidth:width
        content: [
            "Application started using their Upstart job to ensure:",
            " correct env",
            " confinement",
            " single-instance",
            "App can be in non-running (Stopped, Stateless, Killed) \nor running (Focused, Unfocused) states",
            " apps are notified on state transitions, so that they can store/restore state",
            " see <b>StateSaver</b> SDK component!"
        ]
    }

    Slide {
        title: "Application lifecycle"
        contentWidth: width
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/lifecycle.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Deploying your app"
        subtitle: "Let's test our creation!"
    }

    Slide {
        title: "Deploying your app: easy!"
        contentWidth: width
        content: [
            "Tools->Options->Ubuntu->Create Click Target",
            "Choose armhf or amd64 target arch",
            "Configure your project to use the just created Kit",
            "Plug in and setup USB access to the device",
            "Press the green arrow (Run, CTRL+R)",
            "<b>Enjoy!</b>"
        ]
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Internationalization"
        subtitle: "Make your app available in multiple languages"
    }
    Slide {
        title: "Internationalization"
        contentWidth: width
        content: [
            "i18n.tr(\"String %1\").arg(firstVar)",
            "SDK will create .pot file with all strings that need translating",
            "Prefix code comments with //TRANSLATORS:",
            " to leave info about context of use",
            "See QML Locale documentation for useful methods",
            ".po files hold the translations, one file per language",
            "app only ships .mo binary file, built by SDK"]
    }


    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Publishing your app"
        subtitle: "Make it available to all users"
    }

    Slide {
        title: "Publishing your app"
        content: [
            "Register to Ubuntu MyApps",
            "Build the package using Ubuntu SDK",
            "Run automatic checks using SDK",
            " Publish->\"Build and Validate package\"",
            "Upload .click package to MyApps",
            "<b>Publish!</b>"
        ]
        Image {
            anchors.left: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/2
            fillMode: Image.PreserveAspectFit
            source: "assets/myapps_webpage.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Ubuntu's roadmap"
        subtitle: "What does the future look like?"
    }

    Slide {
        title: "Roadmap"
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "assets/roadmap.png"
        }
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Ubuntu's Community"
        subtitle: "The heart of the platform"
    }

    Slide {
        title: "Ubuntu's Community"
        contentWidth: width
        content: [
            "Joyful and respectful community developed around Ubuntu Touch",
            "Many of the core apps are developed by community members!",
            " Canonical provides Design support",
            "We wouldn't be here without you, <b>thank you</b>!",
            "Join the discussions on mailing lists, report bugs, give feedback!",
            " <b>We do listen! :)</b>",
            "<b>Join Ubuntu Online Summit, 3-5 May 2016</b>",
            " <b>summit.ubuntu.com</b>"
        ]
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "Credits"
    }

    Slide {
        title: "Credits"
        contentWidth: width
        content: [
            "SDK Team at Canonical",
            " for their feedback on the presentation",
            "my friend Timur Kristóf",
            " for the idea (and code) of using particle effects on cursor position change in the livecoding editor",
            " check him out! github.com/venemo",
            "Gunnar Sletta",
            " for the QML presentation system I used as a base",
            "Community Team at Canonical",
            " for providing guidance on the presentation"
        ]
    }

    Slide {
        useUbuntuBackground: true
        verticallyCenterTitle: true
        title: "That's all, folks!"
        subtitle: "<b>Any questions?<br><br>
<b>andrea.bernabei@canonical.com</b><br><br>
<b>@faenil on Twitter</b><br><b>faenil on FreeNode IRC</b><br>
                    <br><b>Check out the API online!</b><br><b>https://developer.ubuntu.com/api/apps/qml/</b><br><br><b>#ubuntu-app-devel IRC @ FreeNode</b><br><br><b>Mailing list: https://lists.launchpad.net/ubuntu-phone/</b>"
    }

    LiveCoding {
        id: liveCodingArena
        state: "hidden"

        Connections {
            target: presentation
            //binding text to codeSample is not enough, the binding will be broken when we modify the code
            onCurrentSlideChanged: if (slides[currentSlide].codeSample !== "")
                                       liveCodingArena.text = slides[currentSlide].codeSample
        }

        Behavior on y {
            SpringAnimation {
                spring: 3
                damping: 0.3
            }
        }

        states: [
        State {
                name: "hidden"
                PropertyChanges {
                    target: liveCodingArena
                    y: -2*presentation.height
                }
                PropertyChanges {
                    target: liveCodingArena
                    focus: false
                }
                PropertyChanges {
                    target: presentation
                    focus: true
                }
            },
            State {
                name: "shown"
                PropertyChanges {
                    target: liveCodingArena
                    y: 0
                }
                PropertyChanges {
                    target: liveCodingArena
                    focus: true
                }
                PropertyChanges {
                    target: presentation
                    focus: false
                }
            }

        ]
    }
}
