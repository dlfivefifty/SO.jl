#!/bin/bash

if [ ! -d $HOME/Projects/$2.jl ]; then
	git clone https://github.com/$1/$2.jl $HOME/Projects/$2.jl
fi

$HOME/Projects/julia/julia -e "using Pkg; Pkg.develop(PackageSpec(url=\"$HOME/Projects/$2.jl\"))"