module RedefStructs

export @redef, @redef_

macro redefinable(struct_def)
    struct_def isa Expr && struct_def.head == :struct || error("struct definition expected")
    is_unionall = false
    if struct_def.args[2] isa Symbol
        name = struct_def.args[2]
        real_name = struct_def.args[2] = gensym(name)
    elseif struct_def.args[2].head == :curly
        is_unionall = true
        name = struct_def.args[2].args[1]
        real_name = struct_def.args[2].args[1] = gensym(name)
    elseif struct_def.args[2].head == :<:
        if struct_def.args[2].args[1] isa Symbol
            name = struct_def.args[2].args[1]
            real_name = struct_def.args[2].args[1] = gensym(name)
        elseif struct_def.args[2].args[1].head == :curly
            is_unionall = true
            name = struct_def.args[2].args[1].args[1]
            real_name = struct_def.args[2].args[1].args[1] = gensym(name)
        else
            error("expected `S <: AbstractType`")
        end
    else
        error("expected `S` or `S <: AbstractType`")
    end
    if is_unionall
        fix_name = :($real_name.body.name.name = $(QuoteNode(name)))
    else
        fix_name = :($real_name.name.name = $(QuoteNode(name)))
    end
    esc(quote
        $struct_def
        $fix_name
        $name = $real_name # this should be `const $name = $real_name`
    end)
end

macro redef_(struct_def)
    struct_def isa Expr && struct_def.head == :struct || error("struct definition expected")
    @show struct_def.args[2]
    is_unionall = false
    if struct_def.args[2] isa Symbol
        name = struct_def.args[2]
        real_name = struct_def.args[2] = gensym(name)
    elseif struct_def.args[2].head == :curly
        is_unionall = true
        name = struct_def.args[2].args[1]
        real_name = struct_def.args[2].args[1] = gensym(name)
    elseif struct_def.args[2].head == :<:
        if struct_def.args[2].args[1] isa Symbol
            name = struct_def.args[2].args[1]
            real_name = struct_def.args[2].args[1] = gensym(name)
        elseif struct_def.args[2].args[1].head == :curly
            is_unionall = true
            name = struct_def.args[2].args[1].args[1]
            real_name = struct_def.args[2].args[1].args[1] = gensym(name)
        else
            error("expected `S <: AbstractType`")
        end
    else
        error("expected `S` or `S <: AbstractType`")
    end
    @show name
    @show real_name
    if is_unionall
        fix_name = :($real_name.body.name.name = $(QuoteNode(name)))
    else
        fix_name = :($real_name.name.name = $(QuoteNode(name)))
    end
    esc(quote
        $struct_def
        $fix_name
        $name = $real_name # this should be `const $name = $real_name`
    end)
end

macro redef(struct_def)
    struct_def isa Expr && struct_def.head == :struct || error("struct definition expected")
    @show struct_def.args[2]
    is_unionall = false
    if struct_def.args[2] isa Symbol
        name = struct_def.args[2]
        real_name = struct_def.args[2] = gensym(name)
    elseif struct_def.args[2].head == :curly
        is_unionall = true
        name = struct_def.args[2].args[1]
        real_name = struct_def.args[2].args[1] = gensym(name)
    elseif struct_def.args[2].head == :<:
        if struct_def.args[2].args[1] isa Symbol
            name = struct_def.args[2].args[1]
            real_name = struct_def.args[2].args[1] = gensym(name)
        elseif struct_def.args[2].args[1].head == :curly
            is_unionall = true
            name = struct_def.args[2].args[1].args[1]
            real_name = struct_def.args[2].args[1].args[1] = gensym(name)
        else
            error("expected `S <: AbstractType`")
        end
    else
        error("expected `S` or `S <: AbstractType`")
    end
    @show name
    @show real_name
    if is_unionall
        fix_print = :(Base.show_datatype(io::Base.IO, ::Base.Type{$real_name.body}) = Base.print(io, $(QuoteNode(name))))
    else
        fix_print = :(Base.show_datatype(io::Base.IO, ::Base.Type{$real_name}) = Base.print(io, $(QuoteNode(name))))
    end
    esc(quote
        $struct_def
        $fix_print
        $name = $real_name # this should be `const $name = $real_name`
    end)
end

end # module
