#!/bin/bash
 
#Linux Spotify Ad Mute v2
#Put this script in the directory the "spotify" binary is in (e.g. /usr/share/spotify).
#To open Spotify, run it instead of the "spotify" binary.
#System sound will be muted as soon as an ad plays
#Find updated versions at: http://pcworldsoftware.kilu.net/files/link_spotify-admute.php and/or https://gist.github.com/pcworld
#On Debian, you need the package "pulseaudio-utils" for the command line util "pactl" which used in this script
#
#Update: For newer 0.8.x versions (x>4; such as 0.8.8), use this script: https://gist.github.com/pcworld/3198763/#comment-813440
#For 0.9.x: https://gist.github.com/pcworld/3198763/#comment-857143
#
#Copyright (c) 2012, "pcworld", 0188801@gmail.com
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of the author nor the
# names of its contributors may be used to endorse or promote products
# derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
#DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # http://stackoverflow.com/a/246128
 
dbus-monitor "type='signal',path='/org/mpris/MediaPlayer2',member='PropertiesChanged'" | grep --line-buffered 'string "Metadata"' |
while read -r line ; do
if ! [[ "`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify / org.freedesktop.MediaPlayer2.GetMetadata`" == *'string "mpris:artUrl"'* ]]
then
pactl set-sink-mute 0 yes
else
pactl set-sink-mute 0 no
fi
done &
$DIR/spotify "$@" &
wait $! &&
test -z "`jobs -p`" || kill `jobs -p` # http://stackoverflow.com/a/2618497
