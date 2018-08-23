#!/bin/bash

if [ ! -d $HOME/Projects/$2.jl ]; then
	git clone https://github.com/$1/$2.jl $HOME/Projects/$2.jl
fi
if [ -d $HOME/.julia/v0.6/$2 ]; then
	rm -rf $HOME/.julia/v0.6/$2
fi
ln -s $HOME/Projects/$2.jl $HOME/.julia/v0.6/$2



/Applications/Julia-0.7.app/Contents/Resources/julia/bin/julia -e "using Pkg; Pkg.develop(PackageSpec(url=\"$HOME/Projects/$2.jl\"))"
/Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia -e "using Pkg; Pkg.develop(PackageSpec(url=\"$HOME/Projects/$2.jl\"))"
