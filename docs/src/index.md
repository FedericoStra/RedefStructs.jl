```@meta
CurrentModule = RedefStructs
```

# RedefStructs.jl

Documentation for [RedefStructs.jl](https://github.com/FedericoStra/RedefStructs.jl).

This package provides the macros [`@redef`](@ref), [`@redef_print`](@ref), and [`@kwredef`](@ref)
which allow to create `struct`ures which are redefinable.

```@contents
Depth = 3
```

## Examples

Using [`@redef`](@ref):

```jldoctest
julia> using RedefStructs

julia> @redef struct S
           s::String
       end

julia> S("Hello").s
"Hello"

julia> @redef mutable struct S
           n::Int
       end

julia> S(42).n
42
```

Using [`@redef_print`](@ref):

```jldoctest
julia> using RedefStructs

julia> @redef_print struct S
           s::String
       end

julia> S("Hello").s
"Hello"

julia> @redef_print mutable struct S
           n::Int
       end

julia> S(42).n
42
```

Using [`@redef`](@ref):

```jldoctest
julia> using RedefStructs

julia> @kwredef struct S
           s::String = "<empty>"
       end

julia> S("Hello").s
"Hello"

julia> @kwredef mutable struct S
           a::Int = 0
           b::Int
       end

julia> S(b=42).a
0
```

## Library

```@index
```

### Public

```@autodocs
Modules = [RedefStructs]
Private = false
```

### Private

```@autodocs
Modules = [RedefStructs]
Public = false
```
