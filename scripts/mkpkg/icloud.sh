#!/bin/bash
set -e
apt-fast install -y npm
sudo npm install -g nativefier
wget https://i.imgur.com/m0abT4k.png -O icon.png
nativefier -p linux -a x64 -i icon.png --disable-context-menu --disable-dev-tools --single-instance https://www.icloud.com/
mkdir -pv icloud/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv iCloud-linux-x64 icloud/opt/icloud
mv icon.png icloud/usr/share/pixmaps/icloud.png
ELECTRON_RELEASE=`wget -qO- https://www.electronjs.org/releases/stable|grep release-entry|head -n1|cut -d '"' -f4`
cat <<EOF |tee icloud/DEBIAN/control
Package: icloud
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: all
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://github.com/dundee/gdu
Description: Access Apple iCloud on Linux.
EOF
cat <<EOF |tee icloud/usr/share/applications/icloud.desktop
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Apple iCloud on Linux.
Name=iCloud
GenericName=Apple iCloud desktop app
Icon=icloud
Exec=/opt/icloud/icloud
Categories=Network
EOF
dpkg-deb -b icloud .
mv icloud*.deb tmp/packages
# gyp libjs-inherits libjs-is-typedarray libjs-psl libjs-typedarray-to-buffer libnode-dev libssl-dev libuv1-dev node-abbrev node-agent-base node-ajv node-ansi node-ansi-regex node-ansi-styles node-ansistyles node-aproba node-archy node-are-we-there-yet node-asap node-asn1 node-assert-plus node-asynckit node-aws-sign2 node-aws4 node-balanced-match node-bcrypt-pbkdf node-brace-expansion node-builtins node-cacache node-caseless node-chalk node-chownr node-clone node-color-convert node-color-name node-colors node-columnify node-combined-stream node-concat-map node-console-control-strings node-copy-concurrently node-core-util-is node-dashdash node-debug node-defaults node-delayed-stream node-delegates node-depd node-ecc-jsbn node-encoding node-err-code node-escape-string-regexp node-extend node-extsprintf node-fast-deep-equal node-forever-agent node-form-data node-fs-write-stream-atomic node-fs.realpath node-function-bind node-gauge node-getpass node-glob node-graceful-fs node-gyp node-har-schema node-har-validator node-has-flag node-has-unicode node-hosted-git-info node-http-signature node-https-proxy-agent node-iconv-lite node-iferr node-imurmurhash node-indent-string node-inflight node-inherits node-ini node-ip node-ip-regex node-is-typedarray node-isarray node-isexe node-isstream node-jsbn node-json-parse-better-errors node-json-schema node-json-schema-traverse node-json-stable-stringify node-json-stringify-safe node-jsonify node-jsonparse node-jsonstream node-jsprim node-leven node-lockfile node-lru-cache node-mime node-mime-types node-minimatch node-mkdirp node-move-concurrently node-ms node-mute-stream node-nopt node-normalize-package-data node-npm-bundled node-npm-package-arg node-npmlog node-number-is-nan node-oauth-sign node-object-assign node-once node-opener node-osenv node-p-map node-path-is-absolute node-performance-now node-process-nextick-args node-promise-inflight node-promise-retry node-promzard node-psl node-puka node-punycode node-qs node-read node-read-package-json node-readable-stream node-request node-resolve node-resolve-from node-retry node-rimraf node-run-queue node-safe-buffer node-semver node-set-blocking node-signal-exit node-slash node-spdx-correct node-spdx-exceptions node-spdx-expression-parse node-spdx-license-ids node-sshpk node-ssri node-string-decoder node-string-width node-strip-ansi node-supports-color node-tar node-text-table node-through node-tough-cookie node-tunnel-agent node-tweetnacl node-typedarray-to-buffer node-unique-filename node-universalify node-uri-js node-util-deprecate node-uuid node-validate-npm-package-license node-validate-npm-package-name node-verror node-wcwidth.js node-which node-wide-align node-wrappy node-write-file-atomic node-yallist npm