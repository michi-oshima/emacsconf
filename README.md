# emacsconf

You are welcome to make use of this configuration, but it is really meant
for my personal use only.

This configuration offers:

   1. Clojure dev environment via inf-clojure.
   1. Lumo dev environment via inf-clojure.
   1. Python dev environment with Elpy
   1. Some custom key bindings and themes

## Requirements

   1. OS: Linux (should work on MacOS, but you may want to change some
      key-bindings)
   1. Emacs 25 and up (I think).  Will not work on Emacs 24.

## Installation

I like to install my emacs config (this repository) like this:

   1. Clone this repository to somewhere like `~/lib`.
   1. Create a symbolic link from your home directory to the cloned
      repository, making sure to name the link `.emacs.d`: `ln -s
      ~/lib/emacsconf ~/.emacs.d`
   1. Under the `externals` dir in the cloned repository, there are
      some config files that you'd want but don't belong to emacs.
      Create symbolic links to these files from your home directory:
      `ln -s ~/lib/emacsconf/externals/.flake8 ~/.flake8`, for
      example.
	  
## Usage: Clojure (with Leiningen)

For a definitive guide, refer to the `inf-clojure` documentation:

   * https://github.com/clojure-emacs/inf-clojure
   
I'm going to repeat the information here:

In your leiningen project, insert the following option:
```
  :jvm-opts ["-Dclojure.server.repl={:port 5555 :accept clojure.core.server/repl}"]
```
Then run a repl from the base directory of your project.  It's where `project.clj` is.
```
$ lein repl
```
Then open your clojure source code (*.clj) in emacs and type `C-c` and then `C-z` to open a REPL session.

To view the available key-binding, invoke `C-h f RET inf-clojure-mode`
and `C-h f RET inf-clojure-minor-mode` or simply browse their menus.

## Usage: Lumo

For a definitive guide, refer to the `inf-clojure` documentation:

   * https://github.com/clojure-emacs/inf-clojure
   
I'm going to repeat the information here:

To use a lumo REPL via `inf-clojure`, you must run a lumo repl manually.
Open a shell, then invoke it like this:

```
$ lumo --dumb-terminal --socket-repl 5555 
```
You must be at the root directory of your project.  It's where the directory `node_modules` is located.

Then open your lumo source code (*.cljs) in emacs and type `C-c` and then `C-z` to open a REPL session.

To view the available key-binding, invoke `C-h f RET inf-clojure-mode`
and `C-h f RET inf-clojure-minor-mode` or simply browse their menus.

## Usage: Python

For a definitive quide, refer to the `elpy` documentation:

   * https://elpy.readthedocs.io/en/latest/

Open a python script in emacs and simply type `C-c` and then `C-z` to open a REPL session.

## install.sh

I placed a convenient install script (convenient for me at least).  It installs all configuration files and also build-dependencies for emacs 24 (in debian file).  Here's what I do:

   1. Run ./install.sh (this installs config files and emacs 24 build dependencies)
   2. Run `sudo apt install ./my_custom_build_emacs25.deb`

Why the build-dependencies for emacs 24?  My custom built emacs 25 does not run without it.
