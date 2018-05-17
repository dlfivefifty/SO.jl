#!/bin/bash

if [ ! -d $HOME/Projects/$2 ]; then
	git clone https://github.com/$1/$2.jl $HOME/Projects/$2.jl
fi
if [ -d $HOME/.julia/v$JULIA_VERSION/$2 ]; then
	rm -rf $HOME/.julia/v$JULIA_VERSION/$2
fi
ln -s $HOME/Projects/$2.jl $HOME/.julia/v$JULIA_VERSION/$2
