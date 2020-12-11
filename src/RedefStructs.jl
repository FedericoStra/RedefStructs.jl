module RedefStructs

export @redef, @redef_print

macro redef(struct_def)
    name = struct_def_name(struct_def)
    real_name = gensym(name)
    struct_def = replace!(struct_def, name, real_name)
    fix_name = :(Base.unwrap_unionall($real_name).name.name = $(QuoteNode(name)))
    esc(quote
        $struct_def
        $fix_name
        $name = $real_name # this should be `const $name = $real_name`
        nothing # avoid returning the new struct
    end)
end

@doc """
    @redef [mutable] struct S [<: A]
        ...
    end

Define a structure in a manner that allows redefinitions.

# Examples

```
@redef struct S
    s::String
end

@redef mutable struct S
    n::Int
end
```
""" :(@RedefStructs.redef)

macro redef_print(struct_def)
    name = struct_def_name(struct_def)
    real_name = gensym(name)
    struct_def = replace!(struct_def, name, real_name)
    fix_print = :(Base.show_datatype(io::Base.IO, ::Base.Type{Base.unwrap_unionall($real_name)}) = Base.print(io, $(QuoteNode(name))))
    esc(quote
        $struct_def
        $fix_print
        $name = $real_name # this should be `const $name = $real_name`
        nothing # avoid returning the new struct
    end)
end

"""
    struct_def_name(struct_def)

Returns the name of the `struct` being defined in a `struct ... end` block.
"""
function struct_def_name(struct_def)
    struct_def isa Expr && struct_def.head == :struct || error("expected struct definition")
    sig = struct_def.args[2]    # signature of the struct: `struct <sig> ... end`
    if sig isa Symbol
        sig
    elseif sig.head == :curly
        sig.args[1]
    elseif sig.head == :<:      # `struct <sig> <: ... ... end`
        sig = sig.args[1]
        if sig isa Symbol
            sig
        elseif sig.head == :curly
            sig.args[1]
        else
            error("invalid `<:` signature, expected `S <: AbstractType`")
        end
    else
        error("expected signature `S` or `S <: AbstractType`")
    end
end

"""
    replace!(code::Expr, old::Symbol, new::Symbol)

Replaces every appearance of `old` in `code` with `new`.
Modifies `code` and returns it.

"""
function replace!(code::Expr, old::Symbol, new::Symbol)
    code.head = replace!(code.head, old, new)
    for i in eachindex(code.args)
        code.args[i] = replace!(code.args[i], old, new)
    end
    code
end

function replace!(code::Symbol, old::Symbol, new::Symbol)
    code === old ? new : code
end

function replace!(code, old::Symbol, new::Symbol)
    code
end

end # module
