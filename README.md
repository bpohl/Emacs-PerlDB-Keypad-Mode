# PerlDB-Keypad-Mode
#### Buffer specific minor mode that takes control of the numeric keypad to navigate when using the Perl debugger in Emacs.

Buffer specific minor mode that takes control of the numeric keypad to navigate when using the Perl debugger in Emacs.


## Installation

Most simply, use `make`:

        $ make install

The install implies the compilation so one command is enough.  For the whole sequence do:

        $ make
        $ make install
        $ make clean

The clean just removes the `.elc` files.

If more control is needed, then these environment variables are available to set:

* `EMACS`     - Path to the Emacs executable.  Defaults to `emacs` with no directory so `$PATH` is searched. 
* `PREFIX`    - Defaults to `/usr/local`.
* `SITE_LISP` - Defaults to `${PREFIX}/share/emacs/site-lisp`.

#### Invocation

Can be added to any buffer with `M-x perldb-keypad-mode` or automatically by adding this, likely within a `perl-mode-hook` to the `.emacs` file:

        (autoload 'perldb-keypad-mode "perldb-keypad-mode"
                  "Use keypad to navigate Perl debugger." t)
        (add-hook 'perldb-mode-hook 'perldb-keypad-mode t)


## Usage

The keypad control will be active only in the buffers that have the minor mode turned on.  In other buffers the keypad will act as normally.

#### Current Default Keymap

Not all the keypad keys are used.  Any without a use are disabled so as to not cause accidental text entry.

|Key     |Action       |Dectription                               |
|--------|-------------|------------------------------------------|
|`0`     |`gud-cont`   |Continue to next breakpoint               |
|`1`     |`gud-finish` |Return from current subroutine            |
|`2`     |`gud-next`   |Execute current line                      |
|`3`     |`gud-step`   |Step into subroutine on current line      |
|`ENTER` |`Enter`      |The `ENTER` key                           |

#### Adding Keys

As of this writing only the five keys above are set to do anything.  All the rest are set to execute `unused-key` so they quietly run without complaining of not being defined.  However, that means all the keys are listed in the module code in `perldb-keypad-mode.el`.  Therefor, just edit the file and change `unused-key` to the desired function and re-install.


## Version

<!-- $Id: 6a79a2527b28d0b959bb4e0302e028212bce47da$ -->

$Revision: Wed Oct 28 22:46:32 2020 -0500 on branch main$<br>$Tags: none$

## Copyright

&copy; 2020 Bion Pohl/Omega Pudding Software Some Rights Reserved

$Author: Bion Pohl$<br>$Email: software@omega-pudding.com$
