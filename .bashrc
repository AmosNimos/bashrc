#Last Updated: Sat 25 Sep 2021 06:04:17 PM EDT
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)


# Folder path
pico8_path="~/Documents/pico8/pico-8/pico8"
cube2_path="cd ~/Documents/manual_install/sauerbraten/ && ./sauerbraten_unix"
dcdp_path="py ~/Documents/python/dcdp.py"


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

# some more ls aliases
#alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'

export EDITOR='nano'
export VISUAL_EDITOR='gedit'

# My custom alias >>

# Main alias
alias myip="hostname -I | awk '{print $1}'"
alias py="python3"
alias pip="pip3"

# Secondary alias
alias closepc="/sbin/shutdown +0"
alias awerc="$VISUAL_EDITOR ~/.config/awesome/rc.lua"
alias p2t="pdftotext -layout"
alias exe="chmod +x"
alias vioff="set -o emacs"
alias vion="set -o vi"
alias www="bollux"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias blueman=blueman-manager
alias moc=mocp
alias q=exit

# game name
alias supertux="supertux2"
alias editcube="sauerbraten"
alias tetris="bastet"
alias ani="~/Documents/shell/ani-cli/ani-cli"

# softwair path
alias pico8=$pico8_path
alias cube2=$cube2_path
alias cubelan="sauerbraten-server -nLOCAL_LAN_SERVER -c5 -mmasterserver"
alias dcdp=$dcdp_path

# Display the text color pallet of the terminal
function textcolor(){
	reset=$'\e[0m'
	for x in {0..0}; do 
		for i in {30..37}; do 
		    for a in {40..47}; do 
		        echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
		    done
		    echo
		done
	done
	echo "$reset"
}

# Use the "top" or the "ps -aux" commands to list the process to terminate and add square braket around the first letter like this [p]rocess.
# With great power comes great responsibility
# to kill by name and no by process id use pkill
function hitman(){
	red=$'\e[0;91m'
	reset=$'\e[0m'
	kill_count=1
	echo "$red"
	echo "___    ___     ___     _________     ___        __                    ___    __"
	echo "\ /    \ /     \ /    |/  | |  \|    \  \      / /         /\         \  \   \/"
	echo "| |    | |     | |        | |        |\  \    // |        /. \        ||\ \  ||"
	echo "| |____| |     | |        | |        ||\  \  //| |       // \ \       || \ \ ||"
	echo "| |    | |     | |        | |        || \  \// | |      //___\ \      ||  \ \||"
	echo "| |    | |     | |        | |        ||  \  /  | |     //     \ \     ||   \  |"
	echo "/_\    /_\     /_\        /_\       /_\   \/   /_\    /_\     /__\   /__\   \_|"
	echo
	echo "$1 [TERMINATION]"
	echo
	echo $(ps -aux | grep $1)
	echo
	echo "..."
	echo "[KILL]"
		kill $(ps aux | grep $1 | awk '{print $2}')  || kill_count=0
	
	if [ $kill_count -eq 1 ];then
		echo "$1 [TERMINATED]."
		echo $kill_count
	else 
		clear
		echo "[MISSION FAILED]"
		echo "TARGET STATUS:[ALIVE]"
	fi
	echo "$reset"
}

# Convert pdf to epub (also create a text version)
pdf2e(){
	pdftotext -layout "$1".pdf "$1".txt
	ebook-convert "$1".txt "$2".epub
	#If you don't also whant a txt version, uncomment the next line.
	#rm "$1".txt
}

# Add curent directory to favorit path text file.
fav(){
	location=/var/tmp/favorit_path.txt
	if [[ ! -e $location ]]; then
		echo "/home/$USER" > $location
	fi 
	echo "$(pwd)" >> $location
	echo "$(pwd) was added to favorit"
}

# cd to selected directory from the favorit path text file.
cdf(){
	# Check if file exist
	location=/var/tmp/favorit_path.txt
	if [[ ! -e $location ]]; then
		touch $location
	fi 
	index=1
	IFS=$'\n'       # make newlines the only separator
	set -f          # disable globbing
	
	# Display history
	echo "Favorit:"
	for path in $(cat < $location); do
	  echo " $index: $path"
	  index=$((index+1));
	done
	
	echo; # Section separation
	
	# take user input as selection
	read -p "Selection: " selection
	
	# if a complete path is entered as selection:
	number_range='^[0-9]+$'
	if ! [[ $selection =~ $number_range ]] ; then
	   cd $selection
	   grep -qxF "$selection" $location || echo "$(pwd)/$selection" >> $location
	else # if index is entered as selection:
		# NEED TO BE FIXED (ONLY SELECT FROM HISTORY AND INDEX)
		new_path=$(sed -n "${selection}p" $location)
		echo "Destination: $new_path"
		cd "$new_path"
	fi
	clear
	echo "[$(pwd)]:"
	ls
}

# List cd temporary history and choose an index or a path
# cd to directory and save directory to temporary history
cdl(){
	# Check if file exist
	local_ls=/tmp/ls_local.txt
	if [ "$#" -gt "0" ]; then # if argument is given cd to argument
		cd "$1"
		#grep -qxF "$@" $location || echo "$@" >> $location
	elif [ "$#" -lt "1" ]; then # If no argument is given choose index
		index=1 # already counting the ".." option
		IFS=$'\n'       # make newlines the only separator
		set -f          # disable globbing
		
		#Display local directory content
		echo "Local:";
		> $local_ls # empty file
		echo ".." >> $local_ls
		echo " $index: .."
		index=$((index+1));
		for path in $(ls); do
			echo " $index: $path"
			echo $path >> $local_ls
			index=$((index+1)); # I need a solution to diferentiate between both section.
		done
		
		echo; # Section separation
		
		# take user input as selection
		read -p "Selection: " selection
		
		# if a complete path is entered as selection:
		number_range='^[0-9]+$'
		if ! [[ $selection =~ $number_range ]] ; then
		   cd $selection
		   #grep -qxF "$selection" $location || echo "$(pwd)/$selection" >> $location
		else # if index is entered as selection:
			# NEED TO BE FIXED (ONLY SELECT FROM HISTORY AND INDEX)
			new_path=$(sed -n "${selection}p" $local_ls)
			echo "Destination: $new_path"
			cd "$new_path"
			#grep -qxF "$new_path" $location || echo "$(pwd)/$new_path" >> $location
		fi
	fi
	clear
	echo "[$(pwd)]:"
	ls
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# My function alias >>

# stupid usless programme
cpu(){
	yellow=$'\e[0;33m'
	green=$'\e[1;32m'
	red=$'\e[0;91m'
	reset=$'\e[0m'
	blue=$'\e[0;94m'
	while true; do
		clear
		cpu_usage=$(top -n 1 -b | awk '/^%Cpu/{print int($2)}' )
		echo
		if [ $cpu_usage -lt 10 ]; then
			# Smaller then 10
			echo  "  ╔═══════════╗"
			echo  "  ║ CPU: [$green$cpu_usage%$reset] ║"
			echo  "  ╚═══════════╝" 
			sleep 20
		elif [ $cpu_usage -lt 100 ]; then
			# Larger then 10
			echo  "  ╔════════════╗"
			echo  "  ║ CPU: [$blue$cpu_usage%$reset] ║"
			echo  "  ╚════════════╝"
			sleep 15
		else
			# Larger then 99
			echo  "  ╔═════════════╗"
			echo  "  ║ CPU: [$red$cpu_usage%$reset] ║"
			echo  "  ╚═════════════╝"
			sleep 10
		fi
	done
}

# A basic stopwatch from stackoverflow
stopwatch(){
	BEGIN=$(date +%s)

	echo Starting Stopwatch...
	echo Press Q to exit.

	while true; do
		NOW=$(date +%s)
		let DIFF=$(($NOW - $BEGIN))
		let MINS=$(($DIFF / 60))
		let SECS=$(($DIFF % 60))
		let HOURS=$(($DIFF / 3600))
		let DAYS=$(($DIFF / 86400))

		# \r  is a "carriage return" - returns cursor to start of line
		printf "\r%3d Days, %02d:%02d:%02d" $DAYS $HOURS $MINS $SECS

	# In the following line -t for timeout, -N for just 1 character
		read -t 0.25 -N 1 input
		if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
	# The following line is for the prompt to appear on a new line.
		    echo
		    break 
		fi
	done
}

# Display main disk free space
memory(){
	#df -BG | sed -n '1p'
	clear
	echo
	df -BG | sed -n '4p'| awk '{print "  Disk name:  [\033[34m" $1 "\033[0m]\n" "  Free space: [" "\033[1;32m" $4 "\033[0m" "/" "\033[1;31m" $2 "\033[0m" "] \n  Used space:" " [\033[1;31m" $3 "\033[0m]" "(\033[34m" $5 "\033[0m)"  }'
	echo
}

# open bashrc file with the default visual text editor.
bashrc(){
	nohup $VISUAL_EDITOR ~/.bashrc & disown
	sleep 0.5
	clear
}

# run a command without outputing the result to terminal.
run(){
	"$1" & disown
	sleep 0.5
	clear
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

# Calculate
calc(){
	echo "$1" | bc
}

#Download audio from youtube video
yt-mp3(){
	dir=~/Music/yt-mp3
	if [[ ! -e $dir ]]; then
		mkdir $dir
	fi
	
	if [ $2 == "-o" ];then
		#if argument 2 is empty
		youtube-dl --restrict-filenames --extract-audio --audio-format 'mp3' --output "$dir/$3/%(title)s.%(ext)s" "$1"
	elif [ $2 == "-q" ] | [ $2 -eq 0 ]; then
		#cd "/home/l/Documents/global/nohup"
		nohup youtube-dl --restrict-filenames --extract-audio --audio-format 'mp3' --output "$dir/$3/%(title)s.%(ext)s" "$1" &> /tmp/nohup.out
		sleep 0.2
		exit
	else
		echo "Missing argument"
		echo $2
	fi
}

#List video files and play selection
vidl() {
	echo "Historic: $(<~/Videos/historic.txt)"
	line=$(ls -1q | wc -l)
	vid=$(ls | dmenu -p $line)
	if [ $# -eq 0 ]
	then
		mpv --no-sub "$vid" & disown
	else 
		mpv $@ "$vid"& disown
	fi
	echo "$vid" > ~/Videos/historic.txt
	sleep 0.5
	clear
}

# list files/directorys and do X with selection, where x is a command given as the argument first argument. 
lsn() {
	line=$(ls -1q | wc -l)
	selection=$(ls | dmenu -p $line)
	$1 $selection $2 
}

#Record screen with sound
recs() {
	dir=~/Videos/recs
	dim=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
	echo "$dim"
	if [[ ! -e $dir ]]; then
		mkdir $dir
	else
		ffmpeg -f x11grab -s "$dim" -i :0 -f alsa -i default ~/Videos/recs/$1.mkv || ffmpeg -f x11grab -s "$dim" -i :1 -f alsa -i default ~/Videos/recs/$1.mkv
	fi
}

#Record microphone only
mic() {
	dir=~/Music/mic
	
	# Take a file format as the second argument
	if [ -z "$2" ]; then
		format=".wav"
	else
		format="$2"
	fi
	
	if [[ ! -e $dir ]]; then
		mkdir $dir
	else
		rec ~/Music/mic/$1$format
	fi
}

# Merge images and sound to avi video format
tovid(){
	# ffmpeg -i ep1.png -i ep1.wav ep1.flv
	# ffmpeg -r 1 -loop 1 -i ep1.jpg -i ep1.wav -acodec copy -r 1 -shortest -vf scale=1280:720 ep1.flv
	# ffmpeg -loop 1 -i $Image -i $Audio -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest out.mp4
	Image=$1
	Audio=$2
	Out=$3
	ffmpeg -y -i $Image -i $Audio -c:a copy $Out.avi
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
		#sleep 30
		
	# In the following line -t for timeout, -N for just 1 character
		read -t 0.25 -N 1 input
		if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
	# Quit the programme.
		    clear
		    break 
		fi
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
	# In the following line -t for timeout, -N for just 1 character
		read -t 0.25 -N 1 input
		if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
	# Quit the programme.
		    clear
		    break 
		fi
	done
}

# Open the terminal path with file manager
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

# preview hex color in the terminal
show_col() {
    perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

# a small math game
mgame(){
	x=2
	y=$((2 + $RANDOM % 9))
	while true; do
		a=$(echo "$x*$y" | bc)
		answer=0
		read -p "$x * $y : " answer	
		if [ $answer == $a ]; then
			echo "[True]"
			x=$((x+1));
		else 
			echo "[False]"
			echo "(The answer was $a.)"
			break  
		fi
	done
}

# Convert file format from x to y
function conv(){
	# default convert text to epub
	# take input file format as first argument
	if [ "$1" == "-pdf" ]; then
		pdftotext -layout "$2".pdf "$2".txt
	elif [ "$2" == "-epub" ]; then
		ebook-convert "$2".epub "$2".txt
	else
		ebook-convert "$2".txt "$2".epub
	fi
}

function yt-st(){
	# dependencies: mpv youtube-dl fzf rofi/dmenu gnu-grep

	# NOTE:  if you dont have gnu grep you can replace grep with rg

	# explain usage
	function usage () {
		echo "usage: yt"
		echo "    -h        help"
		echo "    -c        channels/subscriptions"
		echo "    -s query  search"
		echo "    -g / -r   gui mode (rofi/dmenu)"
		echo "    -m        music mode (audio only) [dont use with -r]"
		echo "  nothing     use defaults (search from prompt)"
		echo
		echo "add channel names to the file $sublistpath to show them"
		echo "in yt -c option. First word should be channel url, optionally"
		echo "followed by tab and then anything else (channel name/description)"
		echo "channels not in sublist can be viewed by typing their url in the prompt"
		echo 
		echo "example file format:"
		echo "markrober       Mark Rober"
		echo "vsauce1         VSauce          Michael Steven's Channel"
		echo "BlackGryph0n    Black Gryph0n   Gabriel Brown signs stuff"
		echo "TomScottGo      Tom Scott"
		echo "danielthrasher  Daniel Thrasher"
		exit 0
	}

	# dont use defaults
	useDefaults="f"

	# no args -> use defaults
	if [[ ${#} -eq 0 ]]; then
		useDefaults="t"
	fi

	# available flags
	optstring=":s:cgrhm"

	defcmd="fzf"
	defaction="s"
	guicmd="rofi -dmenu -i" #uncomment next line for dmenu
	#guicmd="dmenu -i -l 15"

	#Defaults
	promptcmd="$defcmd"
	action="$defaction"
	isGui="f"
	query=""
	mpv_options=""

	# subscription list
	mkdir -p "${HOME:-}/.config/yt"
	sublistpath="${HOME:-}/.config/yt/sublist"
	sublist=""
	[ -f "$sublistpath" ] && sublist=$(cat "$sublistpath") 

	# if not using defaults search for flags
	if [[ $useDefaults = "f" ]]; then
		while getopts ${optstring} arg; do
		    case "${arg}" in
		        s) 
		            # search in youtube for a query
		            action="s"
		            query="${OPTARG}" ;;
		        c) 
		            # search in subscriptions for specific channel
		            action="c"
		            query="${OPTARG}" ;;
		        g|r) 
		            # set gui mode to true and change the prompt to gui prompt
		            isGui="t"
		            promptcmd="$guicmd" ;;
		        m)
		           # make the mpv headless
		            mpv_options+="--no-video" ;;
		        h) 
		            # display help / usage
		            usage ;;
		        \?) 
		            # wrong args -> exit with explanation of usage
		            echo "invalid option: -${OPTARG}"
		            echo
		            usage
					exit 1 ;;
		        :) 
		            # missing args -> exit with explanation of usage
		            echo "Option -${OPTARG} needs an argument"
		            echo
		            usage
					exit 1 ;;

		    esac
		done
	fi

	# if no query is set with flags then ask for one
	if [ -z "$query" ]; then
		# ask for a channel
		if [[ $action = "c" ]]; then
		    # if in gui mode use gui prompt
		    if [[ $isGui = "t" ]]; then 
				query=$($promptcmd -p "Channel: " <<< "$sublist")
		        promptcmd="$promptcmd -p Video:"
		    else
		        query=$($promptcmd --print-query <<< "$sublist" | tail -n1)
		    fi
			query=$(echo "$query" | awk '{print $1}')
		else
		    # ask for a query
		    # if in gui mode use gui prompt
		    if [[ $isGui = "t" ]]; then 
		        query=$(echo | $promptcmd -p "Search: ")
		        promptcmd="$promptcmd -p Video:"
		    else
		        echo -n "Search: "
		        read -r query
		    fi
		fi
	fi 

	# program cancelled -> exit
	if [ -z "$query" ]; then exit; fi 

	# clean query / channel
	query=$(sed \
	  -e 's|+|%2B|g'\
	  -e 's|#|%23|g'\
	  -e 's|&|%26|g'\
	  -e 's| |+|g' <<< "$query")


	# if channel look for channel vids
	if [[ $action = "c" ]]; then
		response=$(curl -s "https://www.youtube.com/c/$query/videos" |\
		  sed "s/{\"gridVideoRenderer/\n\n&/g" |\
		  sed "s/}]}}}]}}/&\n\n/g" |\
		  awk -v ORS="\n\n" '/gridVideoRenderer/')

		# if unable to fetch the youtube results page, inform and exit
		if ! grep -q "gridVideoRenderer" <<< "$response"; then echo "unable to fetch yt"; exit 1; fi

		# regex expression to match video entries from yt channel page
		# get the list of videos and their ids to ids
		ids=$(awk -F '[""]' '{print $6 "\t" $50;}' <<< "$response" | grep "^\S")

		# url prefix for videos
		videolink="https://youtu.be/"

		# prompt the results to user infinitely until they exit (escape)
		while true; do
		  choice=$(echo -e "$ids" | cut -d'	' -f2 | $promptcmd) # dont show id
		  if [ -z "$choice" ]; then exit; fi	# if esc-ed then exit
		  id=$(echo -e "$ids" | grep -Fwm1 "$choice" | cut -d'	' -f1) # get id of choice
		  echo -e "$choice\t($id)"
		  case $id in
		      ???????????) mpv "$videolink$id" "$mpv_options" ;;
		      *) exit ;;
		  esac
		done
	else
		# if in search show query result vids
		response="$(curl -s "https://www.youtube.com/results?search_query=$query" |\
		  sed 's|\\.||g')"
		# if unable to fetch the youtube results page, inform and exit
		if ! grep -q "script" <<< "$response"; then echo "unable to fetch yt"; exit 1; fi
		# regex expression to match video and playlist entries from yt result page
		vgrep='"videoRenderer":{"videoId":"\K.{11}".+?"text":".+?[^\\](?=")'
		pgrep='"playlistRenderer":{"playlistId":"\K.{34}?","title":{"simpleText":".+?[^\"](?=")'
		# grep the id and title
		# return them in format id (type) title
		getresults() {
		    grep -oP "$1" <<< "$response" |\
		      awk -F\" -v p="$2" '{ print $1 "\t" p " " $NF}'
		}
		# get the list of videos/playlists and their ids in videoids and playlistids
		videoids=$(getresults "$vgrep")
		playlistids=$(getresults "$pgrep" "(playlist)")
		# if there are playlists or videos, append them to list
		[ -n "$playlistids" ] && ids="$playlistids\n"
		[ -n "$videoids" ] && ids="$ids$videoids"
		# url prefix for videos and playlists
		videolink="https://youtu.be/"
		playlink="https://youtube.com/playlist?list="
		# prompt the results to user infinitely until they exit (escape)
		while true; do
		    choice=$(echo -e "$ids" | cut -d'	' -f2 | $promptcmd) # dont show id
		    if [ -z "$choice" ]; then exit; fi	# if esc-ed then exit
		    id=$(echo -e "$ids" | grep -Fwm1 "$choice" | cut -d'	' -f1) # get id of choice
		    echo -e "$choice\t($id)"
		    case $id in
		        # 11 digit id = video
		        ???????????) mpv "$videolink$id" "$mpv_options" ;;
		        # 34 digit id = playlist
		        ??????????????????????????????????) mpv "$playlink$id" "$mpv_options" ;;
		        *) exit ;;
		    esac
		done
	fi
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
	echo
	echo "Command: tovid"
	echo "Description: Merge a picture and a sound file to output a video"
	echo "Arguments: Images.format Sound_file.format Output.format"
}


## Openning Message here. 
#clear && echo && echo ' \ (•◡•) <[ Hello, World. ]' && echo ""
#clear && echo && echo '  ( ≖.≖) <[ I am watching you. ]' && echo ""
#clear && echo && echo '  t(>.<t) <[ Fuuuuuck! ]' && echo ""
#clear && echo && echo "  ┗ ( ･o･) ┓ <[ it's gnu/linux! ]" && echo
#clear && echo -e "🐇 You Take The Red Pill - You Stay In Wonderland, And I Show You How Deep The Rabbit Hole Goes.\n"

#moc -l "/home/amos/Music/yt-mp3/acdc/bnb.mp3"

#Display date
echo "[$Blue$(date)$Reset]"

# Replace right shift with tild 
	#xmodmap -e 'keycode 62 = 0x007e'
# Replace right control with grave
	#xmodmap -e "keycode 105 = grave"
# Swap caps and escape
	#setxkbmap -option "caps:swapescape"

#chenge the terminal mode from emacs to vi
	#set -o vi
#-----
