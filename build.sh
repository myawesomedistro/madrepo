#!/bin/bash
wget -O- https://sourceforge.net/projects/madlinux/files/repo/dists/core/main/binary-amd64/Packages|grep 'Package:\|Version:'|sed ':a;N;$!ba;s/\nVersion://g'|sed 's/Package: //g'>repo/packages-amd64-`date +'%d-%m-%Y-%H-%M'`.log
wget -O- https://sourceforge.net/projects/madlinux/files/repo/dists/core/main/binary-i386/Packages|grep 'Package:\|Version:'|sed ':a;N;$!ba;s/\nVersion://g'|sed 's/Package: //g'>repo/packages-i386-`date +'%d-%m-%Y-%H-%M'`.log
mkdir -pv tmp/packages
for script in scripts/mkpkg/*.sh
do
 bash $script
done
for script in scripts/getpkg/*.sh
do
 bash $script
done
mv *.deb tmp/packages
find tmp/packages -name '*.deb' -type f|xargs reprepro -P --ask-passphrase -Vb repo includedeb core
cat repo/dists/core/main/binary-amd64/Packages|grep 'Package:\|Version:'|sed ':a;N;$!ba;s/\nVersion://g'|sed 's/Package: //g'>repo/packages-amd64-`date +'%d-%m-%Y-%H-%M'`.log
cat repo/dists/core/main/binary-i386/Packages|grep 'Package:\|Version:'|sed ':a;N;$!ba;s/\nVersion://g'|sed 's/Package: //g'>repo/packages-i386-`date +'%d-%m-%Y-%H-%M'`.log
diff --new-line-format="+ %L" --old-line-format="- %L" --unchanged-line-format="= %L" repo/packages-amd64*|grep '+ ' > packages.log
diff --new-line-format="+ %L" --old-line-format="- %L" --unchanged-line-format="= %L" repo/packages-amd64*|grep '\- ' >> packages.log
diff --new-line-format="+ %L" --old-line-format="- %L" --unchanged-line-format="%L" repo/packages-i386*|grep '+ ' >> packages.log
diff --new-line-format="+ %L" --old-line-format="- %L" --unchanged-line-format="%L" repo/packages-i386*|grep '\- ' >> packages.log7