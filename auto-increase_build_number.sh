# Lines below are expected to add to `Build Phases` of Xcode.


buildPlist="${PRODUCT_SETTINGS_PATH}"
# Get the existing buildVersion and buildNumber values from the buildPlist
buildVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" $buildPlist)
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" $buildPlist)
buildDate=$(date "+%Y%m%d.%H%M%S")

# Increment the buildNumber
buildNumber=$(($buildNumber + 1))


/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" $buildPlist
#/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $buildVersion.$buildNumber" $buildPlist
