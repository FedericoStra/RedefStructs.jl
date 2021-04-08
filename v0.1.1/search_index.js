var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = RedefStructs","category":"page"},{"location":"#RedefStructs.jl","page":"Home","title":"RedefStructs.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for RedefStructs.jl.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package provides the macro @redef, which allows to create structures which are redefinable.","category":"page"},{"location":"#Example","page":"Home","title":"Example","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"julia> using RedefStructs\n\njulia> @redef struct S\n           s::String\n       end\n\njulia> S(\"Hello\").s\n\"Hello\"\n\njulia> @redef mutable struct S\n           n::Int\n       end\n\njulia> S(42).n\n42","category":"page"},{"location":"#Library","page":"Home","title":"Library","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [RedefStructs]","category":"page"},{"location":"#RedefStructs.replace!-Tuple{Expr, Symbol, Symbol}","page":"Home","title":"RedefStructs.replace!","text":"replace!(code::Expr, old::Symbol, new::Symbol)\n\nReplaces every appearance of old in code with new. Modifies code and returns it.\n\n\n\n\n\n","category":"method"},{"location":"#RedefStructs.struct_def_name-Tuple{Any}","page":"Home","title":"RedefStructs.struct_def_name","text":"struct_def_name(struct_def)\n\nReturns the name of the struct being defined in a struct ... end block.\n\n\n\n\n\n","category":"method"},{"location":"#RedefStructs.@redef-Tuple{Any}","page":"Home","title":"RedefStructs.@redef","text":"@redef [mutable] struct S [<: A]\n    ...\nend\n\nDefine a structure in a manner that allows redefinitions.\n\nExamples\n\n@redef struct S\n    s::String\nend\n\n@redef mutable struct S\n    n::Int\nend\n\n\n\n\n\n","category":"macro"}]
}
