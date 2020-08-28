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
# install postfix non-interactively first to prevent emacs24 build dependency installation
# from blocking.
echo "postfix postfix/mailname string example.com" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'No configuration'" | sudo debconf-set-selections
sudo apt-get install -y postfix
# alternative experimental way to avoid postfix configuration.  Needs testing
# sudo (DEBIAN_FRONTEND=noninteractive apt-get build-dep emacs24 -y)

sudo apt-get build-dep emacs24 -y
echo "========= build dependencies for emacs24 ========="

if command -v conda &> /dev/null
then
    # our conda environment does not come with flake8
    conda install flake8
fi

popd

echo "All Done."
