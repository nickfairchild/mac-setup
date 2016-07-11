#!/usr/bin/env bash

cd $HOME
git clone https://github.com/laravel/homestead.git Homestead
cd Homestead
bash init.sh
cd $HOME