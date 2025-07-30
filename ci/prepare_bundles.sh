#!/bin/bash

function doOneArch {
	mkdir bundles/$3
	cp -v -R target/smithereen.jar schema.sql examples/nginx.conf bundles/$3
	cp ci/bundle_install.sh bundles/$3/install.sh
	sed -i -e "s/__arch__/$2/g" bundles/$3/install.sh
	chmod +x bundles/$3/install.sh
	pushd bundles/$3
	tar -cvzf ../../smithereen-bundle-$3.tar.gz .
	popd
}

mkdir bundles
doOneArch "amd64" "x86_64" "x86_64"
doOneArch "arm64" "aarch64" "arm64"

ls -lR bundles
