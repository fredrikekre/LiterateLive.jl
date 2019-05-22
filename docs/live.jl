using LiveServer

sw = LiveServer.SimpleWatcher()

const SOURCES = [
    joinpath(@__DIR__, "make.jl"),
    joinpath(@__DIR__, "src", "index.jl")
]

append!(sw.watchedfiles, LiveServer.WatchedFile.(SOURCES))

function callback(x)
    # only trigger for source files to avoid infinite loop
    if x in SOURCES
        include(joinpath(@__DIR__, "make.jl"))
        LiveServer.file_changed_callback(x)
    end
end

callback(joinpath(@__DIR__, "make.jl")) # make sure files exist
LiveServer.set_callback!(sw, callback)

LiveServer.serve(sw; dir = joinpath(@__DIR__, "build"), verbose=true)
