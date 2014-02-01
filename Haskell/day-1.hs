module Main where
  -- Reverse a list by concating the head
  -- to the reverse of the tail.
  listReverse :: [a] -> [a]
  listReverse [] = []
  listReverse (h:t) = listReverse(t) ++ [h]

  -- Unique unordered combinations of a list.
  combinations :: Ord a => [a] -> [(a, a)]
  combinations list = [(a, b) | a <- list, b <- list, a < b]

  -- Builds multiplication tables.
  multTable :: [Integer] -> [(Integer, Integer, Integer)]
  multTable list = [(a, b, a * b) | a <- list, b <- list]

  -- Assigns colors to tennessee, mississippi
  -- alabama, georgia, and florida so that
  -- no states that touch have the same color
  --
  -- implementation copied from prolog
  colors = ["red", "green", "blue"]
  mapColor = [(tennessee, mississippi, alabama, georgia, florida) |
    tennessee <- colors,
    mississippi <- colors,
    alabama <- colors,
    georgia <- colors,
    florida <- colors,
    tennessee /= mississippi,
    tennessee /= alabama,
    tennessee /= georgia,
    mississippi /= alabama,
    alabama /= georgia,
    alabama /= florida,
    georgia /= florida]

