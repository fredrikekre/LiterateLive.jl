using Documenter
using LiterateLive
using Literate

Literate.markdown(joinpath(@__DIR__, "src", "index.jl"), joinpath(@__DIR__, "src"))

makedocs(
    sitename = "LiterateLive",
    modules = [LiterateLive],
    pages = ["Home" => "index.md"]
)
