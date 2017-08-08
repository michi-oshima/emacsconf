# emacsconf

You are welcome to make use of this configuration, but this is meant
for my personal use only.

This configuration offers:

   1. Clojure dev environment with Cider, but without Paredit.
   1. Python dev environment with Elpy
   1. Some custom key bindings and themes

## Requirements

   1. Real OS: i.e., not Windows.
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
