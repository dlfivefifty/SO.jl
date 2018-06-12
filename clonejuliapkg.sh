#!/bin/bash

if [ ! -d $HOME/Projects/$2.jl ]; then
	git clone https://github.com/$1/$2.jl $HOME/Projects/$2.jl
fi
if [ -d $HOME/.julia/v0.6/$2 ]; then
	rm -rf $HOME/.julia/v0.6/$2
fi
ln -s $HOME/Projects/$2.jl $HOME/.julia/v0.6/$2
$HOME/Projects/julia7/julia -e "Pkg.develop(\"$HOME/Projects/$2.jl\")"
