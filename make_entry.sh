#!/bin/bash
# not working 
entries="~/Dropbox/"
this_date=$(date +"%Y-%m-%d_%H:%M")

filename="$(echo $this_date)_journal.md"
filetitle="# $this_date"

cd $entries

echo $filetitle >> $filename
