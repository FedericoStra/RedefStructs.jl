.PHONY: all
all: makedocs


.PHONY: makedocs
makedocs:
	julia --project make.jl


DOCTEST_CMD = \
using Documenter: DocMeta, doctest ;\
using RedefStructs ;\
DocMeta.setdocmeta!(RedefStructs, :DocTestSetup, :(using RedefStructs); recursive=true) ;\
doctest(RedefStructs)

.PHONY: doctest
doctest:
	julia --project -e '$(DOCTEST_CMD)'
