# Package
using DataFrames, MixedModels, Random, CategoricalArrays

# Seed
Random.seed!(7)

# Data with a lot of groups (n=5'000'000): doesn't works
df1 = DataFrame(id =  categorical(repeat(1:1000000, inner = 5)),
                x1 = rand(5000000),
                x2 = rand(5000000),
                y = rand(5000000))

r1 = fit(MixedModel, @formula(y ~ x1 + x2 + (1|id)), df1)

# Data with few groups (n=5'000'000): works
df2 = DataFrame(id =  categorical(repeat(1:5, inner = 1000000)),
                x1 = rand(5000000),
                x2 = rand(5000000),
                y = rand(5000000))

r2 = fit(MixedModel, @formula(y ~ x1 + x2 + (1|id)), df2)