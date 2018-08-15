#!/bin/bash

src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ext_dir="${src_dir}/externals"
confs=(.editorconfig .flake8 .tmux.conf)

pushd ~

echo "Installing emacs.d..."
ln -s ${src_dir} .emacs.d

for f in "${confs[@]}"
do
    echo "Installing ${f}..."
    ln -s "${ext_dir}/${f}"
done

echo "========= build dependencies for emacs24 ========="
# experimental way to avoid postfix configuration.  Needs testing.
# sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'No configuration'"
# sudo apt-get install -y postfix
# sudo apt-get build-dep emacs24 -y

# alternative experimental way to avoid postfix configuration.  Also needs testing
# sudo (DEBIAN_FRONTEND=noninteractive apt-get build-dep emacs24 -y)

sudo apt-get build-dep emacs24 -y
echo "========= build dependencies for emacs24 ========="

popd

echo "All Done."
