#XCode command line tools

xcode-select --install

#brew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew doctor
brew update

brew install gcc
brew install cmake


#julia

cp $HOME/Projects/SO.jl/Make.user $HOME/Projects/julia/
cd $HOME/Projects/julia/
make

ln -sf /opt/intel/compilers_and_libraries_2018.3.185/mac/mkl/lib/libmkl_rt.dylib  usr/lib/julia/libmkl_rt.dylib

ln -sf /opt/intel/compilers_and_libraries_2018.3.185/mac/mkl/lib/libmkl_intel_thread.dylib  usr/lib/julia/libmkl_intel_thread.dylib

make


## Run in Julia

Pkg.update()
Pkg.add("IJulia"); Pkg.add("SingularIntegralEquations"); Pkg.add("Plots"); Pkg.add("Plotly"); Pkg.add("GR"); Pkg.add("GLVisualize"); 


~/.julia/v$JULIA_VERSION/Conda/deps/usr/bin/jupyter notebook
