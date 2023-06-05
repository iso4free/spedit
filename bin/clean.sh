#!/bin/bash

#remove old archives first
rm *.zip -y
rm *.bz2 -y

# strip and pack all compiled executables
strip ./i386-linux/spedit*
upx ./i386-linux/spedit*
strip ./i386-win32/spedit*
upx ./i386-win32/spedit*
strip ./x86_64-linux/spedit*
upx ./x86_64-linux/spedit*
strip ./x86_64-win64/spedit*
upx ./x86_64-win64/spedit*
strip ./x86_64-haiku/spedit*
upx ./x86_64-haiku/spedit*

#creating separate archives for all supported OSes
tar -cvjSf i386-linux.tar.bz2 i386-linux/*
tar -cvjSf x86_64-linux.tar.bz2 x86_64-linux/*
tar -cvjSf x86_64-haiku.tar.bz2 x86_64-haiku/*
zip -r i386-win32.zip i386-win32
zip -r x86_64-win64.zip x86_64-win64
zip -r data.zip languages palettes