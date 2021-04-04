using RedefStructs
using Documenter

DocMeta.setdocmeta!(RedefStructs, :DocTestSetup, :(using RedefStructs); recursive=true)

makedocs(;
    modules=[RedefStructs],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    repo="https://github.com/FedericoStra/RedefStructs.jl/blob/{commit}{path}#{line}",
    sitename="RedefStructs.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FedericoStra.github.io/RedefStructs.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/RedefStructs.jl",
)
