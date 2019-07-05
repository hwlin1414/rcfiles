# $FreeBSD: releng/10.3/etc/root/dot.cshrc 243893 2012-12-05 13:56:39Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -A
alias ll	ls -la
alias ls	ls -FG

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	less
setenv	BLOCKSIZE	K
setenv	CLICOLOR	1
setenv	LSCOLORS	GxFxCxdxBxeggdabagacad

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	set color
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		bindkey "\e[1~" beginning-of-line # Home
		bindkey "\e[7~" beginning-of-line # Home rxvt
		bindkey "\e[2~" overwrite-mode    # Ins
		bindkey "\e[3~" delete-char       # Delete
		bindkey "\e[4~" end-of-line       # End
		bindkey "\e[8~" end-of-line       # End rxvt
	endif

endif
setenv TERM xterm-256color
setenv LC_ALL en_US.UTF-8
setenv LANG en_US.UTF-8
setenv LC_CTYPE en_US.UTF-8
setenv MM_CHARSET UTF-8
#setenv LC_ALL zh_TW.UTF-8
#setenv LANG zh_TW.UTF-8
#setenv LC_CTYPE zh_TW.UTF-8
#setenv MM_CHARSET UTF-8
#setenv LC_ALL zh_TW.big5
#setenv LANG zh_TW.big5
#setenv LC_CTYPE zh_TW.big5
#setenv MM_CHARSET big5
