vimrc
=====

My vimrc file. Tested on Ubuntu/Mac with vim 7.4.

Keys
----

|Key| Meaning
|---|---
| a | enter insertion mode after current character
| b | back word
| c | change command
| d | delete command
| e | end of word
| f | find character after cursor in current line
| g | UNBOUND
| h | move left one character
| i | enter insertion mode before current character
| j | move down one line
| k | move up one line
| l | move right one character
| m | mark current line and position
| n | repeat last search
| o | open line below and enter insertion mode
| p | put buffer after cursor
| q | UNBOUND
| r | replace single character at cursor
| s | substitute single character at cursor
| t | same as "f" but cursor moves to just before found character
| u | undo
| v | UNBOUND
| w | move foreward one word
| x | delete single character
| y | yank command
| z | position current line
| A | enter insertion mode after end of line
| B | move back one Word
| C | change to end of line
| D | delete to end of line
| E | move to end of Word
| F | backwards version of "f"
| G | goto line number prefixed, or goto end if none
| H | home cursor - goto first line on screen
| I | enter insertion mode before first non-whitespace character
| J | join current line with next line
| K | UNBOUND
| L | goto last line on screen
| M | goto middle line on screen
| N | repeat last search, but in opposite direction of original search
| O | open line above and enter insertion mode
| P | put buffer before cursor
| R | replace mode - replaces through end of current line, then inserts
| S | substitute entire line - deletes line, enters insertion mode
| T | backwards version of "t"
| U | restores line to state when cursor was moved into it
| V | UNBOUND
| W | foreward Word
| X | delete backwards single character
| Y | yank entire line
| Z | first half of quick save-and-exit
| ! | shell command filter
| @ | vi eval
| # | UNBOUND
| $ | move to end of line
| % | match nearest [],(),{} on line, to its match (same line or others)
| ^ | move to first non-whitespace character of line
| & | repeat last ex substitution (":s ...") not including modifiers
| * | UNBOUND
| ( | move to previous sentence
| ) | move to next sentence
| \ | UNBOUND
| | | move to column zero
| - | move to first non-whitespace of previous line
| _ | similar to "^" but uses numeric prefix oddly
| = | UNBOUND
| + | move to first non-whitespace of next line
| [ | move to previous "{ ... }" section
| ] | move to next "{ ... }" section
| { | move to previous blank-line separated section
| } | move to next blank-line separated section
| ; | repeat last "f", "F", "t", or "T" command
| ' | move to marked line, first non-whitespace
| ` | move to marked line, memorized column
| : | ex-submode
| " | access numbered buffer; load or access lettered buffer
| ~ | reverse case of current character and move cursor forward
| , | reverse direction of last "f", "F", "t", or "T" command
| . | repeat last text-changing command
| / | search forward
| < | unindent command
| > | indent command
| ? | search backward

Install
-------

If you have `~/.vim` and/or `~/.vimrc`, rename them/it.

```
git clone https://github.com/caiguanhao/vimrc.git ~/.vim
cd ~/.vim
./install.sh
cp vimrc ~/.vimrc

git submodule update --init --recursive
cd bundle/YouCompleteMe && ./install.sh --clang-completer
```

The plugin YouCompleteMe is very big, it may take a long time to
download. If you don't like it, just don't download the plugin.
To use Ag inside vim, build Ag first. You must set up GOPATH.
For more info on installation of each plugin, see the Dockerfile
or the README file of each plugin.

If you want to use vim inside a Docker container, build it first.

```
docker build -t vim .
```

Warning: This vim config file is suitable for editing small files.

LICENSE: MIT
