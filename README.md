# emacsconf

You are welcome to make use of this configuration, but it is really meant
for my personal use only.

This configuration offers:

   1. Clojure dev environment with Cider, but without Paredit.
   1. Python dev environment with Elpy
   1. Some custom key bindings and themes

## Requirements

   1. OS: Linux (should work on MacOS, but you may want to change some
      key-bindings)
   1. Emacs 25 and up (I think).  Will not work on Emacs 24.

## Usage

I like to use my config like this:

   1. Clone this repository to somewhere like `~/lib`.
   1. Create a symbolic link from your home directory to the cloned
      repository, making sure to name the link `.emacs.d`: `ln -s
      ~/lib/emacsconf ~/.emacs.d`
   1. Under the `externals` dir in the cloned repository, there are
      some config files that you'd want but don't belong to emacs.
      Create symbolic links to these files from your home directory:
      `ln -s ~/lib/emacsconf/externals/.flake8 ~/.flake8`, for
      example.

## install.sh

I placed a convenient install script.  (convenient for me at least).  It installs all configuration files and also build-dependencies for emacs 24 (in debian file).  Here's what I do:

   1. Run ./install.sh (this installs config files and emacs 24 build dependencies)
   2. Run `sudo apt install ./my_custom_build_emacs25.deb`

Why the build-dependencies for emacs 24?  My custom built emacs 25 does not run without it.
