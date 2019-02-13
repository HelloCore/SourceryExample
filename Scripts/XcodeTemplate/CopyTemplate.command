#!/bin/bash
cd "$(dirname "$0")"

if [ ! -d "~/Library/Developer/Xcode/Templates/File Templates/Custom/" ]
then
	mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/Custom
fi

cp -R ./RxMVVMC.xctemplate ~/Library/Developer/Xcode/Templates/File\ Templates/Custom/RxMVVMC.xctemplate