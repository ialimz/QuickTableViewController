default: test
test: test-framework

carthage-update:
	carthage update --no-use-binaries --platform ios

coverage:
	bundle exec slather coverage -s --input-format profdata --workspace QuickTableViewController.xcworkspace --scheme QuickTableViewController-iOS QuickTableViewController.xcodeproj

test-framework:
	bundle exec scan

build-example:
	xcodebuild -workspace QuickTableViewController.xcworkspace -scheme Example -sdk iphonesimulator clean build | xcpretty -c && exit ${PIPESTATUS[0]}
