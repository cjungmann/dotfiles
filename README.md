# Dotfiles

Having a dotfiles repository is a thing, and I am finally getting
around to making my own to make it easier to configure new
computers in a familiar way.

I'll explain unusual ones below.

## .bash_extra

Rather than putting my entire __.bashrc__ file under version control,
I made a script with the features I want to propagate into a separate
script that can be *sourced* into the **.bashrc** file.

I make a sym-link from the dotfiles directory to my home directory,
then add the following lines to my **.bashrc** file to safely
include the **.bash_extra** script:

~~~sh
if [ -f ~/.bash_extra ]; then
    source ~/.bash_extra
fi
~~~

## init.el

My **emacs** basic configuration file.  It seems a bit risky to
overwrite the default **init.el** file, but that's what I'm going to do
on a few remote servers to see if it causes trouble.  I'll probably
save the original **init.el** file under a different name, just in case.

Like **.bash_extra**, the **init.el** will remain in the **dotfiles**
directory, with a symlink to __~/.emacs.d__.

