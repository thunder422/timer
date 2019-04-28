# timer
Qt5 Timer Program (for learning Qt5)

KDE 4 contained a nice count-down timer widget.  KDE 5 has an equivalent
widget but is far inferior.  It is missing several features from the KDE
4 version like the ability to add, edit and remove preset timers.  It
also does not work very well when the dark theme has been selected - in
the task bar, the font is grey on slightly different grey font and is
impossible to see.  On the desktop it is black on dark grey.  So I
decided to create my own and learn Qt5 along with QtQuick/QML at the
same time.

This is being developed on Linux (KDE Neon) with the Qt 5.12.3, GCC 7.3
(using C++14) and cmake (3.10.2).  The later two are the default
versions install with KDE Neon (based on Ubuntu 18.04).
