mtg = read_mtg("files/simple_plant.mtg")

# Removing the description because we don't write it anyway:
mtg[:description] = nothing

@testset "test classes" begin
    mtg2 = mktemp() do f, io
        write_mtg(f, mtg)
        mtg2 = read_mtg(f)
        return mtg2
    end

    # Check that all nodes are the same:
    for i in 1:length(mtg)
        @test get_node(mtg, i) == get_node(mtg2, i)
    end
end