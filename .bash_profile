shopt -s extglob  # re

export PATH="/Library/Frameworks/Python.framework/Versions/3.9/apps:${PATH}"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/apps:${PATH}"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export TIME_STYLE=long-iso  # sets yyyy-mm-dd hh:mm as default date format
peter_dir='/Users/peter'
host_dir=$peter_dir  # when working on different host change it to host_dir
PS1=$'\e[1;36m$PWD $ \E[0m'

ad() { 
if [ $# -eq 0 ] ; then
    cd . 
elif [[ -f $1 ]]; then
    code -w $1
else 
    cd $1 
fi 
}  #absorb data
alias adb='code -w ${peter_dir}/.bash_profile'
add() {
    mkdir -p $1
    ad $1
}   #absorb data to dir
adf() {
    for file in "$@"; do
        touch $file
        ad $file
    done
}   #absorb data to file
alias adg='ad ${peter_dir}/git'
alias adh='ad ${host_dir}'
alias adi='code -w ${peter_dir/res/index'
alias adp='ad ${peter_dir}'    
alias adr='ad ${peter_dir}/res'
alias adra='ad ${peter_dir}/res/alfred'
alias adrb='ad ${peter_dir}/res/books'
alias adrc='ad ${peter_dir}/res/chrome'
alias adrd='ad ${peter_dir}/res/db2'
alias adri='ad ${peter_dir}/res/issues'
alias adrj='ad ${peter_dir}/res/jupyter'
alias adrl='ad ${peter_dir}/res/lang'
alias adrn='ad ${peter_dir}/res/notes'
alias adrp='ad ${peter_dir}/res/powershell'
alias adrq='ad ${peter_dir}/res/qualification'
alias adrs='ad ${peter_dir}/res/sh'
alias adrv='ad ${peter_dir}/res/vault'
alias adt='ad ${peter_dir}/tmp'
alias adu='ad ..'    
alias adv='code -w ${peter_dir}/.vimrc'
bd(){
    cat $1 ; printf "\n"
}  #body
alias bp='. ${peter_dir}/.bash_profile'  #build profile
alias cp='cp -R'
cr() { wc -l $@ | awk '{ printf $1 " " $2 "\n" }' | column -t | sed 's/ //'; }  #count rows
cpo(){
    gcp -R $1 $2
    op $2
} # cp + open
alias df='code -dw' #difference
dp(){
    hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000E3,
    "HIDKeyboardModifierMappingDst":0x7000000E3},
    {"HIDKeyboardModifierMappingSrc":0x7000000E0,
    "HIDKeyboardModifierMappingDst":0x7000000E0}]
    }' > /dev/null
    open -a /Applications/BetterTouchTool.app --hide 
    open -a /Applications/Karabiner-Elements.app --hide 
    osascript -e '
    set exclude to {"Google Chrome", "Electron", "Notes", "System Preferences", "java", "Microsoft Remote Desktop", "BetterTouchTool", "Karabiner-Elements", "Alfred 3"}
    tell application "Finder" to set scope to get the name of every process whose visible is true
    repeat with i from 1 to count scope
        if exclude does not contain item i of scope then
            tell application (item i of scope)
                quit
            end tell
        end if
    end repeat'
    open -a "/Applications/Visual Studio Code.app"
    open -a "/Applications/Google Chrome.app"
} # default profile
alias ex='exit'
alias ds='fc -s'
alias fb='which'  #find bin
fd() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type d -iname "$name" 
}  #find $dir
ff() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type f -iname "$name" 
} #find $file
fs() {
    dir="" ; string=""
    if [[ $# == 2 ]] ; then dir="$1/" ; string="$2" ; else dir="$PWD/" ; string="$1" ; fi
    ggrep -nirP --include \*$3 --exclude \*.onnx "$string" "$dir" | awk -F: '{gsub(/^[ \t]+/, "", $2); gsub (/[ \t]+$/, "", $2); gsub(/^[ \t]+/, "", $3); gsub (/[ \t]+$/, "", $3); $3=$3$4$5$6$7$8$9$10; printf ("%s! %3s %s\n", $1, $2, substr($3,0,60))}' | column -t -s '!'
}  #find $string
alias gad='git add'
alias gada='git add -A'
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbrl='git branch -v'
alias gbrm='git branch -m'
alias gbrr='git branch -r'
alias gcf='git config --global'
alias gcfa='git config --global --add'
alias gcfe='git config --global --edit'
alias gcfl='git config --global --list'
alias gcfr='git config --global --replace-all'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcht='git checkout -t'
alias gcl='git clone'
gcm() { git commit -m "$1";}
gcma() { git commit -am "$1";}
gcmm() { git commit --amend -m "$1";}
alias gcn='git clean -fd'
alias gcp='git cherry-pick'
alias gdf='git diff'
alias gft='git fetch'
alias ggr='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gin='git init'
alias glg='git log'
alias gmr='git merge'
alias gp='chmod -R 777'  #grant permissions
gph() { git push origin $1:$1; }
gphf() { git push origin $1:$1 --force; }
alias gpl='git pull origin'
alias grbi='giti rebase -i'
alias grr='git rebase'
alias grs='git reset'
alias grsh='git reset --hard'
alias grv='git revert'
alias gss='git stash'
alias gssl='git stash list'
alias gssp='git stash pop'
alias gst='git status'
alias gtg='git tag'
gz(){
    for file in "$@"; do
        ext="${file##*.}"
        if [[ "$ext" == "zip" ]]; then
            unzip $file
        elif [[ "$ext" == "gz" ]]; then
            gunzip -d $file
        else 
            gzip $file
        fi
    done
}   #gzip
hd() { if [ $# -eq 2 ] ; then head -n $1 $2; printf "\n"; else head $1 ; printf "\n"; fi }  #head $file | head $file $limit
alias hs='history'  #history
alias jn='jupyter notebook'
alias ka='killall'  #kill all
alias kp='kill -9'  #kill process
alias lj='jobs'  #list jobs
la() {
gls -A --group-directories-first $1 -I ".DS_Store" 
}   #list alphabetically
lc() {
gls -lrt $1 |  awk '{print $6,$7,$8,$9}'  | sed -n '1!p'
}  #list chronologically 
alias lg='la ${peter_dir}/git'
lp(){
    if [ $# -eq 0 ]; then
    top
    else
    ps -eaf | grep $1
    fi
}  # list process
alias me='whoami'  #me
alias me='whoami'  #me
alias nd='mkdir -p'  #new directory
nda(){ mkdir -p $1 && cd $1; } #nd + absorb
nds(){ mkdir -p $1 && sd $1; } #nd + stream
alias nf='touch'  #new file
nfo() {
    for file in "$@"; do
        touch $file
        open $file
    done
}   #new file + open
nj() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
}   #new java
njo() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
}   #nj + open
njt() {
touch ${peter_dir}/tmp/Test.java
echo """public class Test{
    public static void main(String args[]){
        
    }
}""" > ${peter_dir}/tmp/Test.java
    open ${peter_dir}/tmp/Test.java 
}   #nj + test
np() {
    for file in "$@"; do
        touch $file.py
    done
}   #new python
npo() {
    for file in "$@"; do
        touch $file.py
        open $file.py
    done
} #np + open
npt() {
    touch ${peter_dir}/tmp/test.py
    open ${peter_dir}/tmp/test.py
}   #np + test
nt() {
    for file in "$@"; do
        touch $file.txt
    done
}   #new text
nto() {
    for file in "$@"; do
        touch $file.txt
        open $file.txt
    done
}   #new text + open
oc(){
    for file in "$@"; do
        open $file -a "Google Chrome"
    done
}   #open with chrome
ov(){
    for file in "$@"; do
        code -w $file
    done
}   #open with vscode
ol(){
    code -gw $2:$1
}   #open line
on(){
    for file in "$@"; do
        open $file -a "Notes"
    done
}   #open with notes
alias op='open' #open with default app
ov(){
    for file in "$@"; do
        open $file -a "Preview"
    done
}   #open with preview
alias pp='pip3'
alias ra='rm -r *' # remove all
re(){
    exclude=
    for i in "$@"; do 
        exclude="$exclude$i|"
    done
    exclude=$(echo ${exclude# } | sed 's/.$//')
    rm -- !($exclude)
}  #remove except
rj(){
    javac $1 &&  java $1
} #run java
rjt(){
    javac ${peter_dir}/tmp/Test.java && java ${peter_dir}/tmp/Test.java
} #rj + test
alias rp='/usr/local/bin/python3' #run python
alias rpt='/usr/local/bin/python3 ${peter_dir}/tmp/test.py' #rp + test
alias rm='rm -r'  #remove
sd() { 
if [ $# -eq 0 ] ; then
    cd . && la
elif [[ -f $1 ]]; then
    code -w $1
else 
    cd $1 && la
fi 
}  #stream data
alias sdb='code -w ${peter_dir}/.bash_profile'
sdd() {
    mkdir -p $1
    sd $1
}   #stream data to dir
sdf() {
    for file in "$@"; do
        touch $file
        sd $file
    done
}   #stream data to file
alias sdg='sd ${peter_dir}/git'
alias sdh='sd ${host_dir}'
alias sdi='code -w ${peter_dir}/index'
alias sdp='sd ${peter_dir}'    
alias sdr='sd ${peter_dir}/res'
alias sdra='sd ${peter_dir}/res/alfred'
alias sdrb='sd ${peter_dir}/res/books'
alias sdrc='sd ${peter_dir}/res/chrome'
alias sdrd='sd ${peter_dir}/res/db2'
alias sdri='sd ${peter_dir}/res/id'
alias sdrj='sd ${peter_dir}/res/jupyter'
alias sdrl='sd ${peter_dir}/res/lang'
alias sdrn='sd ${peter_dir}/res/notes'
alias sdrp='sd ${peter_dir}/res/powershell'
alias sdrq='sd ${peter_dir}/res/qualification'
alias sdrs='sd ${peter_dir}/res/sh'
alias sdrv='sd ${peter_dir}/res/vault'
alias sdt='sd ${peter_dir}/tmp'
alias sdu='sd ..'  #sd upstream
alias sdv='code -w ${peter_dir}/.vimrc'
sp(){
    hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000E3, 
    "HIDKeyboardModifierMappingDst":0x7000000E0},
    {"HIDKeyboardModifierMappingSrc":0x7000000E0,
    "HIDKeyboardModifierMappingDst":0x7000000E3}]
    }' > /dev/null
    osascript -e 'tell app "BetterTouchTool" to quit'
    osascript -e 'tell app "Karabiner-Menu" to quit'
    osascript -e 'tell app "Karabiner-Elements" to quit'
    osascript -e 'tell app "Karabiner-NotificationWindow" to quit'
    launchctl bootout gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server > /dev/null
    osascript -e '
    tell application "Finder"
        set visible of every process whose visible is true and name is not "java" to false
        set the collapsed of windows to true
    end tell
    tell application "System Events"
        key code 124 using control down
    end tell'
} # secure profile
alias py='python'
tl() { if [ $# -eq 2 ] ; then tail -n $1 $2; printf "\n"; else tail $1 ; printf "\n"; fi }  #tail $file | tail $file $limit