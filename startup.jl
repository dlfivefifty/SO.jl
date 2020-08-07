try # avoid bug in building packages
	using LinearAlgebra, Pkg, SparseArrays, Random, Test
catch ex
	println("$ex thrown during startup")
end

try # avoid bug in building packages
	using SpecialFunctions
catch ex
	println("$ex thrown during startup")
end

try # avoid bug in building packages
	isfile("Manifest.toml") && Pkg.activate(".") # auto-activate Project in Juno
catch ex
	println("$ex thrown during startup")
end

try
	import Debugger
catch ex
	println("$ex thrown during startup")
end

macro ent(args)
	quote
	   Debugger.@enter $args
	end
end
