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
sudo apt-get build-dep emacs24 -y
echo "========= build dependencies for emacs24 ========="

popd

echo "All Done."
