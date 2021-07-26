#Last Updated: Thu 08 Jul 2021 09:20:11 PM EDT
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)


##BASIC BASHRC CONFIG (can be ignored)
#-----
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
    else
		color_prompt=no
    fi
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#-----

##CUSTUM CONFIG
#-----
# TEXT COLOR CODE VARIABLE
ps_yellow=$'\[\e[0;33m\]'
ps_green=$'\[\e[1;32m\]'
ps_red=$'\[\e[0;91m\]'
ps_blue=$'\[\e[0;94m\]'
ps_white=$'\[\e[0;97m\]'

Yellow=$'\e[0;33m'
Green=$'\e[1;32m'
Red=$'\e[0;91m'
Blue=$'\e[0;94m'
White=$'\e[0;97m'

# TEXT OPTIONS VARIABLE
bold=$'\e[1m'
uline=$'\e[4m'
ps_reset=$'\[\e[0m\]'
Reset=$'\e[0m'

##Line Prompt Statement One
if [ "$color_prompt" = yes ]; then
    PS1="[$ps_red$(date +%H:%M)$ps_reset][$ps_blue\w$ps_reset]:"
else
    PS1='[\w]:'
fi
unset color_prompt force_color_prompt
##Line Prompt Statement One for xterm (the standard terminal emulator)
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="[$ps_red$(date +%H:%M)$ps_reset][$ps_blue\w$ps_reset]:"
    ;;
*)
    ;;
esac


# don't worry this just terminate a process in case an app is frosen.
# use the "top" command to list the process to terminate and add square braket around the first letter like this [p]rocess.
function hitman(){
echo "___    ___     ___     _________     ___        __                    ___    __"
echo "\ /    \ /     \ /    |/  | |  \|    \  \      / /         /\         \  \   \/"
echo "| |    | |     | |        | |        |\  \    // |        /. \        ||\ \  ||"
echo "| |____| |     | |        | |        ||\  \  //| |       // \ \       || \ \ ||"
echo "| |    | |     | |        | |        || \  \// | |      //___\ \      ||  \ \||"
echo "| |    | |     | |        | |        ||  \  /  | |     //     \ \     ||   \  |"
echo "/_\    /_\     /_\        /_\       /_\   \/   /_\    /_\     /__\   /__\   \_|"
echo "Executing $1 termination order"
	kill $(ps aux | grep $1 | awk '{print $2}')
echo "$1 as been terminated"
#except
} || {
echo "Mission failed, target alive."
}

# some more ls aliases
#alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'

# My custom alias
alias py="python3"
alias pip="pip3"
alias awerc="subl ~/.config/awesome/rc.lua"
alias bashrc="sudo subl ~/.bashrc"
alias myip="hostname -I | awk '{print $1}'"
alias p2t="pdftotext -layout"
alias exe="chmod +x"
alias pdt="py ~/Documents/global/py/pdt.py -t"
alias bashrc="subl ~/.bashrc"
alias tor="cd ~/Documents/web/tor/tor && ./start.desktop"
alias vioff="set -o emacs"
alias vion="set -o vi"
alias closepc="/sbin/shutdown +0"
alias gitpr="cd ~/Documents/git/private/repos"
alias gitpu="cd ~/Documents/git/public/repos"
alias note="vim ~/Documents/git/private/repos/writting/note/note.md"
alias cdwrite="cd ~/Documents/git/private/repos/writting/general" 
alias www=bollux
export EDITOR='nano'
export VISUAL='subl'
#alias memory=""

memory(){
	#df -BG | sed -n '1p'
	clear
	echo
	df -BG | sed -n '4p'| awk '{print "  Disk name:  [\033[34m" $1 "\033[0m]\n" "  Free space: [" "\033[1;32m" $4 "\033[0m" "/" "\033[1;31m" $2 "\033[0m" "] \n  Used space:" " [\033[1;31m" $3 "\033[0m]" "(\033[34m" $5 "\033[0m)"  }'
	echo
}

write(){
	cd ~/Documents/git/private/repos/writting/general && vim "$1"
}

#Download youtube video
ytd(){
	#video_folder="/Videos/youtube"
	echo "saving to "$video_folder
	if [ -z "$2" ];then
		#if argument 2 is empty
		youtube-dl --restrict-filenames --output '~/Videos/youtube/%(uploader)s-%(title)s' "$1"
	elif [ $2 == "-q" ]; then
		#cd "/home/l/Documents/global/nohup"
		nohup youtube-dl --restrict-filenames --output '~/Videos/youtube/%(uploader)s-%(title)s' "$1" &> /tmp/nohup.out
		sleep 0.2
		exit
	elif [ $2 == "-sub" ]; then
		youtube-dl --restrict-filenames --write-sub --sub-lang en --output '~/Videos/youtube/%(uploader)s-%(title)s' "$1"
	else
		youtube-dl --restrict-filenames --output '~/Videos/youtube/%(uploader)s-%(title)s' "$1"
	fi
}

#Download audio from youtube video
yt-mp3(){
	if [ $2 == "-o" ];then
		#if argument 2 is empty
		youtube-dl --restrict-filenames --extract-audio --audio-format 'mp3' --output "~/Music/yt-mp3/$3/%(title)s.%(ext)s" "$1"
	elif [ $2 == "-q" ]; then
		#cd "/home/l/Documents/global/nohup"
		nohup youtube-dl --restrict-filenames --extract-audio --audio-format 'mp3' --output "~/Music/yt-mp3/$3/%(title)s.%(ext)s" "$1" &> /tmp/nohup.out
		sleep 0.2
		exit
	else
		echo "Missing argument"
		echo $2
	fi
}

#List video files
vidl() {
	echo "Historic: $(<~/Videos/historic.txt)"
	line=$(ls -1q | wc -l)
	vid=$(ls | dmenu -p $line)
	if [ $1 == "-sub" ];then
		nohup mpv -fs $vid &> /tmp/nohup.out
	else
		nohup mpv --sub=no -fs $vid &> /tmp/nohup.out
		echo "$vid" > ~/Videos/historic.txt
	fi
}

#Record screen with sound
recs() {
	ffmpeg -f x11grab -s 2560x1440 -i :0 -f alsa -i default ~/Videos/recs/$1.mkv
}

#Record microphone only
mic() {
	rec ~/Music/mic/$1.wav
}

#Remove spaces in file name
nospace() {
	for f in *\ *; do mv "$f" "${f// /$1}"; done
	#find -name "* *" | sort -rz | while read -d $'\0' f; do mv -v "$f" "$(dirname "$f")/$(basename "${f// /$1}")"; done
}

#Display date and time
clock(){
	yellow=$'\e[0;33m'
	green=$'\e[1;32m'
	red=$'\e[0;91m'
	reset=$'\e[0m'
	blue=$'\e[0;94m'
	counter=0
	old=""
	clear
	echo
	echo "  [$blue$(date +%A" "%d" "%B" "%G)$reset]"
	while true; do
		if [ "$old" != "$(date +%H:%M)" ];then
			echo "  [$red$(date +%r)$reset][$green$counter$reset]" #[$green$(date +%D)$reset]
			old="$(date +%H:%M)"
			counter=$((counter+1))
		fi
		sleep 30
	done
}

#Display time minimalistically
clockmn(){
	yellow=$'\e[0;33m'
	green=$'\e[1;32m'
	red=$'\e[0;91m'
	reset=$'\e[0m'
	blue=$'\e[0;94m'
	counter=1
	old=""
	while true; do
		if [ "$old" != "$(date +%H:%M)" ];then
			clear
			echo
			echo "  [$blue$(date +%m-%d-%y)$reset]"
			echo "  [$red$(date +%H:%M)$reset]" #[$green$(date +%D)$reset]
			old="$(date +%H:%M)"
		fi
		sleep 30
	done
}

#Open the terminal path with file manager
go(){
	nohup nautilus . &> /tmp/nohup.out
	sleep 0.2
	exit
}

# turn each line of a text file into the python array format.
makelist(){

	# add the "around each word",
	echo $( cat $1 | sed -e 's/.*/"&",/') > $1

	# remove the last , character
	echo $( cat $1 | sed '$s/.$//') > $1

	# add [ at the start
	sed -i '1i[' $1

	# add [ at the end
	echo $( cat $1 | sed '${s/$/]/}') > $1

	# condense to a single line
	tr -d '\n' < $1
	
	# output the resurling list
	clear
	cat $1
}

# list function
lf(){
	echo "Command: go"
	echo "Description: open the terminal path with file manager."
	echo
	echo "Command: clock"
	echo "Description:display date and time"
	echo
	echo "Command: clockmn"
	echo "Description:display date and time in a minimalistic way"
	echo
	echo "Command: nospace"
	echo "Description:replace spaces with argument 1"
	echo "Arguments:symbol"
	echo
	echo "Command: mic"
	echo "Description: record microphone"
	echo
	echo "Command: recs"
	echo "Description: record screen with mirophone"
	echo "Arguments:directory"
	echo
	echo "Command: vidl"
	echo "Description: list file with dmenu and play them with mpv"
	echo "Arguments: -sub"
	echo
	echo "Command: yt-mp3"
	echo "Description: download audio from youtube link"
	echo "Arguments: link(in quote) [-o,-q] directory_name"
	echo
	echo "Command: ytd"
	echo "Description: download video from youtube link"
	echo "Arguments: link(in quote) [-q,-sub] directory_path"
	echo
	echo "Command: makelist"
	echo "Description: convert the lines of a file to a python format array"
	echo "Arguments: file_path"
}

#clear && echo && echo ' \ (•◡•) <[ Hello, World. ]' && echo ""
#clear && echo && echo '  ( ≖.≖) <[ I am watching you. ]' && echo ""
#clear && echo && echo '  t(>.<t) <[ Fuuuuuck! ]' && echo ""
#clear && echo && echo "  ┗ ( ･o･) ┓" && echo

#Display date
echo "[$Blue$(date)$Reset]"

#replace right shift with tild 
xmodmap -e 'keycode 62 = 0x007e'
#replace right control with grave
xmodmap -e "keycode 105 = grave"

#chenge the terminal mode from emacs to vi
#set -o vi
#-----
