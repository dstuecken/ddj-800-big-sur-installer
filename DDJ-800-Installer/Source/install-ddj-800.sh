#!/bin/bash
echo "---------------------------------------"
echo "Please Provide Your Admin User Password"
echo "---------------------------------------"

RELDIR=`dirname $0`
cd $RELDIR
DIR=`pwd`

/usr/bin/sudo cp -R "${DIR}/DDJ-800 USBAudio.kext" "/Library/Frameworks/"
/usr/bin/sudo chown -R root:wheel "/Library/Frameworks/DDJ-800 USBAudio.kext/"

mkdir -p /Applications/Pioneer/DDJ-800
/usr/bin/sudo cp -R "${DIR}/VersionViewer.app" "/Applications/Pioneer/DDJ-800/VersionViewer.app"

echo "---------------------------------------"
echo "***************************************"
echo "Make sure you open your system settings and go to Security -> Click the lock in top-left corner -> Enter Password -> Click the Allow button"
echo "***************************************"
echo "---------------------------------------"
echo ""

rm -f "~/Library/Preferences/com.pioneerdj.DDJ-800autosetup.plist"
/usr/bin/open -g "/Applications/Pioneer/DDJ-800/VersionViewer.app/Contents/Resources/DDJ-800 AutoLauncher.app"
/usr/bin/sudo kextload -v "/Library/Frameworks/DDJ-800 USBAudio.kext"

ls -la ~/Library/Preferences/com.pioneerdj.*

echo "---------------------------------------"
echo "Done."
echo "---------------------------------------"
echo ""
echo ""
echo "If there are no errors above and you see an output like '-rw-r--r--  1 dennis  staff  315 Dec 12 10:32 .../Library/Preferences/com.pioneerdj.DDJ-800autosetup.plist', the driver is installed."
echo ""
echo "Please reboot your system now."
echo ""
echo ""
