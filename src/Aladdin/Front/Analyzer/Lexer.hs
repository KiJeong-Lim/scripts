module Aladdin.Front.Analyzer.Lexer where

import Aladdin.Front.Analyzer.Grammar
import Aladdin.Front.Header
import qualified Control.Monad.Trans.State.Strict as XState
import qualified Data.Functor.Identity as XIdentity
import qualified Data.Map.Strict as XMap
import qualified Data.Set as XSet


-- the following codes are generated by LGS.

data DFA
    = DFA
        { getInitialQOfDFA :: Int
        , getFinalQsOfDFA :: XMap.Map Int Int
        , getTransitionsOfDFA :: XMap.Map (Int, Char) Int
        , getMarkedQsOfDFA :: XMap.Map Int (XSet.Set Int)
        }
    deriving ()

runAladdinLexer :: String -> Either (Int, Int) [Token]
runAladdinLexer = doLexing . addLoc 1 1 where
    theDFA :: DFA
    theDFA = DFA
        { getInitialQOfDFA = 0
        , getFinalQsOfDFA = XMap.fromAscList [(1, 27), (2, 15), (6, 4), (7, 5), (8, 9), (10, 1), (11, 24), (15, 23), (16, 6), (17, 18), (18, 7), (19, 23), (20, 22), (21, 22), (22, 22), (23, 22), (24, 12), (25, 22), (27, 22), (28, 13), (29, 22), (30, 22), (31, 22), (32, 22), (34, 28), (35, 2), (36, 3), (37, 8), (38, 11), (39, 19), (41, 25), (45, 22), (46, 22), (47, 22), (48, 22), (49, 22), (56, 26), (62, 22), (63, 16), (64, 17), (65, 20), (66, 21), (67, 14)]
        , getTransitionsOfDFA = XMap.fromAscList 
            [ ((0, '\n'), 1), ((0, ' '), 1), ((0, '!'), 2), ((0, '"'), 3), ((0, '\''), 5), ((0, '('), 6), ((0, ')'), 7), ((0, ','), 8), ((0, '-'), 9), ((0, '.'), 10), ((0, '0'), 11), ((0, '1'), 11), ((0, '2'), 11), ((0, '3'), 11), ((0, '4'), 11), ((0, '5'), 11), ((0, '6'), 11), ((0, '7'), 11), ((0, '8'), 11), ((0, '9'), 11), ((0, ':'), 12), ((0, '='), 13), ((0, '?'), 14), ((0, 'A'), 15), ((0, 'B'), 15), ((0, 'C'), 15), ((0, 'D'), 15), ((0, 'E'), 15), ((0, 'F'), 15), ((0, 'G'), 15), ((0, 'H'), 15), ((0, 'I'), 15), ((0, 'J'), 15), ((0, 'K'), 15), ((0, 'L'), 15), ((0, 'M'), 15), ((0, 'N'), 15), ((0, 'O'), 15), ((0, 'P'), 15), ((0, 'Q'), 15), ((0, 'R'), 15), ((0, 'S'), 15), ((0, 'T'), 15), ((0, 'U'), 15), ((0, 'V'), 15), ((0, 'W'), 15), ((0, 'X'), 15), ((0, 'Y'), 15), ((0, 'Z'), 15), ((0, '['), 16), ((0, '\\'), 17), ((0, ']'), 18), ((0, '_'), 19), ((0, 'a'), 20), ((0, 'b'), 20), ((0, 'c'), 20), ((0, 'd'), 20), ((0, 'e'), 20), ((0, 'f'), 21), ((0, 'g'), 20), ((0, 'h'), 20), ((0, 'i'), 20), ((0, 'j'), 20), ((0, 'k'), 22), ((0, 'l'), 20), ((0, 'm'), 20), ((0, 'n'), 20), ((0, 'o'), 20), ((0, 'p'), 23), ((0, 'q'), 20), ((0, 'r'), 20), ((0, 's'), 24), ((0, 't'), 25), ((0, 'u'), 20), ((0, 'v'), 20), ((0, 'w'), 20), ((0, 'x'), 20), ((0, 'y'), 20), ((0, 'z'), 20)
            , ((1, '\n'), 1), ((1, ' '), 1)
            , ((3, ' '), 3), ((3, '!'), 3), ((3, '"'), 41), ((3, '#'), 3), ((3, '$'), 3), ((3, '%'), 3), ((3, '&'), 3), ((3, '\''), 3), ((3, '('), 3), ((3, ')'), 3), ((3, '*'), 3), ((3, '+'), 3), ((3, ','), 3), ((3, '-'), 3), ((3, '.'), 3), ((3, '/'), 3), ((3, '0'), 3), ((3, '1'), 3), ((3, '2'), 3), ((3, '3'), 3), ((3, '4'), 3), ((3, '5'), 3), ((3, '6'), 3), ((3, '7'), 3), ((3, '8'), 3), ((3, '9'), 3), ((3, ':'), 3), ((3, ';'), 3), ((3, '<'), 3), ((3, '='), 3), ((3, '>'), 3), ((3, '?'), 3), ((3, '@'), 3), ((3, 'A'), 3), ((3, 'B'), 3), ((3, 'C'), 3), ((3, 'D'), 3), ((3, 'E'), 3), ((3, 'F'), 3), ((3, 'G'), 3), ((3, 'H'), 3), ((3, 'I'), 3), ((3, 'J'), 3), ((3, 'K'), 3), ((3, 'L'), 3), ((3, 'M'), 3), ((3, 'N'), 3), ((3, 'O'), 3), ((3, 'P'), 3), ((3, 'Q'), 3), ((3, 'R'), 3), ((3, 'S'), 3), ((3, 'T'), 3), ((3, 'U'), 3), ((3, 'V'), 3), ((3, 'W'), 3), ((3, 'X'), 3), ((3, 'Y'), 3), ((3, 'Z'), 3), ((3, '['), 3), ((3, '\\'), 42), ((3, ']'), 3), ((3, '^'), 3), ((3, '_'), 3), ((3, '`'), 3), ((3, 'a'), 3), ((3, 'b'), 3), ((3, 'c'), 3), ((3, 'd'), 3), ((3, 'e'), 3), ((3, 'f'), 3), ((3, 'g'), 3), ((3, 'h'), 3), ((3, 'i'), 3), ((3, 'j'), 3), ((3, 'k'), 3), ((3, 'l'), 3), ((3, 'm'), 3), ((3, 'n'), 3), ((3, 'o'), 3), ((3, 'p'), 3), ((3, 'q'), 3), ((3, 'r'), 3), ((3, 's'), 3), ((3, 't'), 3), ((3, 'u'), 3), ((3, 'v'), 3), ((3, 'w'), 3), ((3, 'x'), 3), ((3, 'y'), 3), ((3, 'z'), 3), ((3, '{'), 3), ((3, '|'), 3), ((3, '}'), 3), ((3, '~'), 3)
            , ((5, ' '), 43), ((5, '!'), 43), ((5, '#'), 43), ((5, '$'), 43), ((5, '%'), 43), ((5, '&'), 43), ((5, '\''), 43), ((5, '('), 43), ((5, ')'), 43), ((5, '*'), 43), ((5, '+'), 43), ((5, ','), 43), ((5, '-'), 43), ((5, '.'), 43), ((5, '/'), 43), ((5, '0'), 43), ((5, '1'), 43), ((5, '2'), 43), ((5, '3'), 43), ((5, '4'), 43), ((5, '5'), 43), ((5, '6'), 43), ((5, '7'), 43), ((5, '8'), 43), ((5, '9'), 43), ((5, ':'), 43), ((5, ';'), 43), ((5, '<'), 43), ((5, '='), 43), ((5, '>'), 43), ((5, '?'), 43), ((5, '@'), 43), ((5, 'A'), 43), ((5, 'B'), 43), ((5, 'C'), 43), ((5, 'D'), 43), ((5, 'E'), 43), ((5, 'F'), 43), ((5, 'G'), 43), ((5, 'H'), 43), ((5, 'I'), 43), ((5, 'J'), 43), ((5, 'K'), 43), ((5, 'L'), 43), ((5, 'M'), 43), ((5, 'N'), 43), ((5, 'O'), 43), ((5, 'P'), 43), ((5, 'Q'), 43), ((5, 'R'), 43), ((5, 'S'), 43), ((5, 'T'), 43), ((5, 'U'), 43), ((5, 'V'), 43), ((5, 'W'), 43), ((5, 'X'), 43), ((5, 'Y'), 43), ((5, 'Z'), 43), ((5, '['), 43), ((5, '\\'), 44), ((5, ']'), 43), ((5, '^'), 43), ((5, '_'), 43), ((5, '`'), 43), ((5, 'a'), 43), ((5, 'b'), 43), ((5, 'c'), 43), ((5, 'd'), 43), ((5, 'e'), 43), ((5, 'f'), 43), ((5, 'g'), 43), ((5, 'h'), 43), ((5, 'i'), 43), ((5, 'j'), 43), ((5, 'k'), 43), ((5, 'l'), 43), ((5, 'm'), 43), ((5, 'n'), 43), ((5, 'o'), 43), ((5, 'p'), 43), ((5, 'q'), 43), ((5, 'r'), 43), ((5, 's'), 43), ((5, 't'), 43), ((5, 'u'), 43), ((5, 'v'), 43), ((5, 'w'), 43), ((5, 'x'), 43), ((5, 'y'), 43), ((5, 'z'), 43), ((5, '{'), 43), ((5, '|'), 43), ((5, '}'), 43), ((5, '~'), 43)
            , ((9, '-'), 34), ((9, '>'), 35)
            , ((11, '0'), 11), ((11, '1'), 11), ((11, '2'), 11), ((11, '3'), 11), ((11, '4'), 11), ((11, '5'), 11), ((11, '6'), 11), ((11, '7'), 11), ((11, '8'), 11), ((11, '9'), 11)
            , ((12, '-'), 38), ((12, ':'), 39)
            , ((13, '>'), 36)
            , ((14, '-'), 37)
            , ((15, '0'), 15), ((15, '1'), 15), ((15, '2'), 15), ((15, '3'), 15), ((15, '4'), 15), ((15, '5'), 15), ((15, '6'), 15), ((15, '7'), 15), ((15, '8'), 15), ((15, '9'), 15), ((15, 'A'), 15), ((15, 'B'), 15), ((15, 'C'), 15), ((15, 'D'), 15), ((15, 'E'), 15), ((15, 'F'), 15), ((15, 'G'), 15), ((15, 'H'), 15), ((15, 'I'), 15), ((15, 'J'), 15), ((15, 'K'), 15), ((15, 'L'), 15), ((15, 'M'), 15), ((15, 'N'), 15), ((15, 'O'), 15), ((15, 'P'), 15), ((15, 'Q'), 15), ((15, 'R'), 15), ((15, 'S'), 15), ((15, 'T'), 15), ((15, 'U'), 15), ((15, 'V'), 15), ((15, 'W'), 15), ((15, 'X'), 15), ((15, 'Y'), 15), ((15, 'Z'), 15), ((15, '_'), 15), ((15, 'a'), 15), ((15, 'b'), 15), ((15, 'c'), 15), ((15, 'd'), 15), ((15, 'e'), 15), ((15, 'f'), 15), ((15, 'g'), 15), ((15, 'h'), 15), ((15, 'i'), 15), ((15, 'j'), 15), ((15, 'k'), 15), ((15, 'l'), 15), ((15, 'm'), 15), ((15, 'n'), 15), ((15, 'o'), 15), ((15, 'p'), 15), ((15, 'q'), 15), ((15, 'r'), 15), ((15, 's'), 15), ((15, 't'), 15), ((15, 'u'), 15), ((15, 'v'), 15), ((15, 'w'), 15), ((15, 'x'), 15), ((15, 'y'), 15), ((15, 'z'), 15)
            , ((20, '0'), 20), ((20, '1'), 20), ((20, '2'), 20), ((20, '3'), 20), ((20, '4'), 20), ((20, '5'), 20), ((20, '6'), 20), ((20, '7'), 20), ((20, '8'), 20), ((20, '9'), 20), ((20, 'A'), 20), ((20, 'B'), 20), ((20, 'C'), 20), ((20, 'D'), 20), ((20, 'E'), 20), ((20, 'F'), 20), ((20, 'G'), 20), ((20, 'H'), 20), ((20, 'I'), 20), ((20, 'J'), 20), ((20, 'K'), 20), ((20, 'L'), 20), ((20, 'M'), 20), ((20, 'N'), 20), ((20, 'O'), 20), ((20, 'P'), 20), ((20, 'Q'), 20), ((20, 'R'), 20), ((20, 'S'), 20), ((20, 'T'), 20), ((20, 'U'), 20), ((20, 'V'), 20), ((20, 'W'), 20), ((20, 'X'), 20), ((20, 'Y'), 20), ((20, 'Z'), 20), ((20, '_'), 20), ((20, 'a'), 20), ((20, 'b'), 20), ((20, 'c'), 20), ((20, 'd'), 20), ((20, 'e'), 20), ((20, 'f'), 20), ((20, 'g'), 20), ((20, 'h'), 20), ((20, 'i'), 20), ((20, 'j'), 20), ((20, 'k'), 20), ((20, 'l'), 20), ((20, 'm'), 20), ((20, 'n'), 20), ((20, 'o'), 20), ((20, 'p'), 20), ((20, 'q'), 20), ((20, 'r'), 20), ((20, 's'), 20), ((20, 't'), 20), ((20, 'u'), 20), ((20, 'v'), 20), ((20, 'w'), 20), ((20, 'x'), 20), ((20, 'y'), 20), ((20, 'z'), 20)
            , ((21, '0'), 20), ((21, '1'), 20), ((21, '2'), 20), ((21, '3'), 20), ((21, '4'), 20), ((21, '5'), 20), ((21, '6'), 20), ((21, '7'), 20), ((21, '8'), 20), ((21, '9'), 20), ((21, 'A'), 20), ((21, 'B'), 20), ((21, 'C'), 20), ((21, 'D'), 20), ((21, 'E'), 20), ((21, 'F'), 20), ((21, 'G'), 20), ((21, 'H'), 20), ((21, 'I'), 20), ((21, 'J'), 20), ((21, 'K'), 20), ((21, 'L'), 20), ((21, 'M'), 20), ((21, 'N'), 20), ((21, 'O'), 20), ((21, 'P'), 20), ((21, 'Q'), 20), ((21, 'R'), 20), ((21, 'S'), 20), ((21, 'T'), 20), ((21, 'U'), 20), ((21, 'V'), 20), ((21, 'W'), 20), ((21, 'X'), 20), ((21, 'Y'), 20), ((21, 'Z'), 20), ((21, '_'), 20), ((21, 'a'), 31), ((21, 'b'), 20), ((21, 'c'), 20), ((21, 'd'), 20), ((21, 'e'), 20), ((21, 'f'), 20), ((21, 'g'), 20), ((21, 'h'), 20), ((21, 'i'), 20), ((21, 'j'), 20), ((21, 'k'), 20), ((21, 'l'), 20), ((21, 'm'), 20), ((21, 'n'), 20), ((21, 'o'), 20), ((21, 'p'), 20), ((21, 'q'), 20), ((21, 'r'), 20), ((21, 's'), 20), ((21, 't'), 20), ((21, 'u'), 20), ((21, 'v'), 20), ((21, 'w'), 20), ((21, 'x'), 20), ((21, 'y'), 20), ((21, 'z'), 20)
            , ((22, '0'), 20), ((22, '1'), 20), ((22, '2'), 20), ((22, '3'), 20), ((22, '4'), 20), ((22, '5'), 20), ((22, '6'), 20), ((22, '7'), 20), ((22, '8'), 20), ((22, '9'), 20), ((22, 'A'), 20), ((22, 'B'), 20), ((22, 'C'), 20), ((22, 'D'), 20), ((22, 'E'), 20), ((22, 'F'), 20), ((22, 'G'), 20), ((22, 'H'), 20), ((22, 'I'), 20), ((22, 'J'), 20), ((22, 'K'), 20), ((22, 'L'), 20), ((22, 'M'), 20), ((22, 'N'), 20), ((22, 'O'), 20), ((22, 'P'), 20), ((22, 'Q'), 20), ((22, 'R'), 20), ((22, 'S'), 20), ((22, 'T'), 20), ((22, 'U'), 20), ((22, 'V'), 20), ((22, 'W'), 20), ((22, 'X'), 20), ((22, 'Y'), 20), ((22, 'Z'), 20), ((22, '_'), 20), ((22, 'a'), 20), ((22, 'b'), 20), ((22, 'c'), 20), ((22, 'd'), 20), ((22, 'e'), 20), ((22, 'f'), 20), ((22, 'g'), 20), ((22, 'h'), 20), ((22, 'i'), 32), ((22, 'j'), 20), ((22, 'k'), 20), ((22, 'l'), 20), ((22, 'm'), 20), ((22, 'n'), 20), ((22, 'o'), 20), ((22, 'p'), 20), ((22, 'q'), 20), ((22, 'r'), 20), ((22, 's'), 20), ((22, 't'), 20), ((22, 'u'), 20), ((22, 'v'), 20), ((22, 'w'), 20), ((22, 'x'), 20), ((22, 'y'), 20), ((22, 'z'), 20)
            , ((23, '0'), 20), ((23, '1'), 20), ((23, '2'), 20), ((23, '3'), 20), ((23, '4'), 20), ((23, '5'), 20), ((23, '6'), 20), ((23, '7'), 20), ((23, '8'), 20), ((23, '9'), 20), ((23, 'A'), 20), ((23, 'B'), 20), ((23, 'C'), 20), ((23, 'D'), 20), ((23, 'E'), 20), ((23, 'F'), 20), ((23, 'G'), 20), ((23, 'H'), 20), ((23, 'I'), 20), ((23, 'J'), 20), ((23, 'K'), 20), ((23, 'L'), 20), ((23, 'M'), 20), ((23, 'N'), 20), ((23, 'O'), 20), ((23, 'P'), 20), ((23, 'Q'), 20), ((23, 'R'), 20), ((23, 'S'), 20), ((23, 'T'), 20), ((23, 'U'), 20), ((23, 'V'), 20), ((23, 'W'), 20), ((23, 'X'), 20), ((23, 'Y'), 20), ((23, 'Z'), 20), ((23, '_'), 20), ((23, 'a'), 20), ((23, 'b'), 20), ((23, 'c'), 20), ((23, 'd'), 20), ((23, 'e'), 20), ((23, 'f'), 20), ((23, 'g'), 20), ((23, 'h'), 20), ((23, 'i'), 28), ((23, 'j'), 20), ((23, 'k'), 20), ((23, 'l'), 20), ((23, 'm'), 20), ((23, 'n'), 20), ((23, 'o'), 20), ((23, 'p'), 20), ((23, 'q'), 20), ((23, 'r'), 20), ((23, 's'), 20), ((23, 't'), 20), ((23, 'u'), 20), ((23, 'v'), 20), ((23, 'w'), 20), ((23, 'x'), 20), ((23, 'y'), 20), ((23, 'z'), 20)
            , ((24, '0'), 20), ((24, '1'), 20), ((24, '2'), 20), ((24, '3'), 20), ((24, '4'), 20), ((24, '5'), 20), ((24, '6'), 20), ((24, '7'), 20), ((24, '8'), 20), ((24, '9'), 20), ((24, 'A'), 20), ((24, 'B'), 20), ((24, 'C'), 20), ((24, 'D'), 20), ((24, 'E'), 20), ((24, 'F'), 20), ((24, 'G'), 20), ((24, 'H'), 20), ((24, 'I'), 20), ((24, 'J'), 20), ((24, 'K'), 20), ((24, 'L'), 20), ((24, 'M'), 20), ((24, 'N'), 20), ((24, 'O'), 20), ((24, 'P'), 20), ((24, 'Q'), 20), ((24, 'R'), 20), ((24, 'S'), 20), ((24, 'T'), 20), ((24, 'U'), 20), ((24, 'V'), 20), ((24, 'W'), 20), ((24, 'X'), 20), ((24, 'Y'), 20), ((24, 'Z'), 20), ((24, '_'), 20), ((24, 'a'), 20), ((24, 'b'), 20), ((24, 'c'), 20), ((24, 'd'), 20), ((24, 'e'), 20), ((24, 'f'), 20), ((24, 'g'), 20), ((24, 'h'), 20), ((24, 'i'), 27), ((24, 'j'), 20), ((24, 'k'), 20), ((24, 'l'), 20), ((24, 'm'), 20), ((24, 'n'), 20), ((24, 'o'), 20), ((24, 'p'), 20), ((24, 'q'), 20), ((24, 'r'), 20), ((24, 's'), 20), ((24, 't'), 20), ((24, 'u'), 20), ((24, 'v'), 20), ((24, 'w'), 20), ((24, 'x'), 20), ((24, 'y'), 20), ((24, 'z'), 20)
            , ((25, '0'), 20), ((25, '1'), 20), ((25, '2'), 20), ((25, '3'), 20), ((25, '4'), 20), ((25, '5'), 20), ((25, '6'), 20), ((25, '7'), 20), ((25, '8'), 20), ((25, '9'), 20), ((25, 'A'), 20), ((25, 'B'), 20), ((25, 'C'), 20), ((25, 'D'), 20), ((25, 'E'), 20), ((25, 'F'), 20), ((25, 'G'), 20), ((25, 'H'), 20), ((25, 'I'), 20), ((25, 'J'), 20), ((25, 'K'), 20), ((25, 'L'), 20), ((25, 'M'), 20), ((25, 'N'), 20), ((25, 'O'), 20), ((25, 'P'), 20), ((25, 'Q'), 20), ((25, 'R'), 20), ((25, 'S'), 20), ((25, 'T'), 20), ((25, 'U'), 20), ((25, 'V'), 20), ((25, 'W'), 20), ((25, 'X'), 20), ((25, 'Y'), 20), ((25, 'Z'), 20), ((25, '_'), 20), ((25, 'a'), 20), ((25, 'b'), 20), ((25, 'c'), 20), ((25, 'd'), 20), ((25, 'e'), 20), ((25, 'f'), 20), ((25, 'g'), 20), ((25, 'h'), 20), ((25, 'i'), 20), ((25, 'j'), 20), ((25, 'k'), 20), ((25, 'l'), 20), ((25, 'm'), 20), ((25, 'n'), 20), ((25, 'o'), 20), ((25, 'p'), 20), ((25, 'q'), 20), ((25, 'r'), 29), ((25, 's'), 20), ((25, 't'), 20), ((25, 'u'), 20), ((25, 'v'), 20), ((25, 'w'), 20), ((25, 'x'), 20), ((25, 'y'), 30), ((25, 'z'), 20)
            , ((27, '0'), 20), ((27, '1'), 20), ((27, '2'), 20), ((27, '3'), 20), ((27, '4'), 20), ((27, '5'), 20), ((27, '6'), 20), ((27, '7'), 20), ((27, '8'), 20), ((27, '9'), 20), ((27, 'A'), 20), ((27, 'B'), 20), ((27, 'C'), 20), ((27, 'D'), 20), ((27, 'E'), 20), ((27, 'F'), 20), ((27, 'G'), 20), ((27, 'H'), 20), ((27, 'I'), 20), ((27, 'J'), 20), ((27, 'K'), 20), ((27, 'L'), 20), ((27, 'M'), 20), ((27, 'N'), 20), ((27, 'O'), 20), ((27, 'P'), 20), ((27, 'Q'), 20), ((27, 'R'), 20), ((27, 'S'), 20), ((27, 'T'), 20), ((27, 'U'), 20), ((27, 'V'), 20), ((27, 'W'), 20), ((27, 'X'), 20), ((27, 'Y'), 20), ((27, 'Z'), 20), ((27, '_'), 20), ((27, 'a'), 20), ((27, 'b'), 20), ((27, 'c'), 20), ((27, 'd'), 20), ((27, 'e'), 20), ((27, 'f'), 20), ((27, 'g'), 45), ((27, 'h'), 20), ((27, 'i'), 20), ((27, 'j'), 20), ((27, 'k'), 20), ((27, 'l'), 20), ((27, 'm'), 20), ((27, 'n'), 20), ((27, 'o'), 20), ((27, 'p'), 20), ((27, 'q'), 20), ((27, 'r'), 20), ((27, 's'), 20), ((27, 't'), 20), ((27, 'u'), 20), ((27, 'v'), 20), ((27, 'w'), 20), ((27, 'x'), 20), ((27, 'y'), 20), ((27, 'z'), 20)
            , ((28, '0'), 20), ((28, '1'), 20), ((28, '2'), 20), ((28, '3'), 20), ((28, '4'), 20), ((28, '5'), 20), ((28, '6'), 20), ((28, '7'), 20), ((28, '8'), 20), ((28, '9'), 20), ((28, 'A'), 20), ((28, 'B'), 20), ((28, 'C'), 20), ((28, 'D'), 20), ((28, 'E'), 20), ((28, 'F'), 20), ((28, 'G'), 20), ((28, 'H'), 20), ((28, 'I'), 20), ((28, 'J'), 20), ((28, 'K'), 20), ((28, 'L'), 20), ((28, 'M'), 20), ((28, 'N'), 20), ((28, 'O'), 20), ((28, 'P'), 20), ((28, 'Q'), 20), ((28, 'R'), 20), ((28, 'S'), 20), ((28, 'T'), 20), ((28, 'U'), 20), ((28, 'V'), 20), ((28, 'W'), 20), ((28, 'X'), 20), ((28, 'Y'), 20), ((28, 'Z'), 20), ((28, '_'), 20), ((28, 'a'), 20), ((28, 'b'), 20), ((28, 'c'), 20), ((28, 'd'), 20), ((28, 'e'), 20), ((28, 'f'), 20), ((28, 'g'), 20), ((28, 'h'), 20), ((28, 'i'), 20), ((28, 'j'), 20), ((28, 'k'), 20), ((28, 'l'), 20), ((28, 'm'), 20), ((28, 'n'), 20), ((28, 'o'), 20), ((28, 'p'), 20), ((28, 'q'), 20), ((28, 'r'), 20), ((28, 's'), 20), ((28, 't'), 20), ((28, 'u'), 20), ((28, 'v'), 20), ((28, 'w'), 20), ((28, 'x'), 20), ((28, 'y'), 20), ((28, 'z'), 20)
            , ((29, '0'), 20), ((29, '1'), 20), ((29, '2'), 20), ((29, '3'), 20), ((29, '4'), 20), ((29, '5'), 20), ((29, '6'), 20), ((29, '7'), 20), ((29, '8'), 20), ((29, '9'), 20), ((29, 'A'), 20), ((29, 'B'), 20), ((29, 'C'), 20), ((29, 'D'), 20), ((29, 'E'), 20), ((29, 'F'), 20), ((29, 'G'), 20), ((29, 'H'), 20), ((29, 'I'), 20), ((29, 'J'), 20), ((29, 'K'), 20), ((29, 'L'), 20), ((29, 'M'), 20), ((29, 'N'), 20), ((29, 'O'), 20), ((29, 'P'), 20), ((29, 'Q'), 20), ((29, 'R'), 20), ((29, 'S'), 20), ((29, 'T'), 20), ((29, 'U'), 20), ((29, 'V'), 20), ((29, 'W'), 20), ((29, 'X'), 20), ((29, 'Y'), 20), ((29, 'Z'), 20), ((29, '_'), 20), ((29, 'a'), 20), ((29, 'b'), 20), ((29, 'c'), 20), ((29, 'd'), 20), ((29, 'e'), 20), ((29, 'f'), 20), ((29, 'g'), 20), ((29, 'h'), 20), ((29, 'i'), 20), ((29, 'j'), 20), ((29, 'k'), 20), ((29, 'l'), 20), ((29, 'm'), 20), ((29, 'n'), 20), ((29, 'o'), 20), ((29, 'p'), 20), ((29, 'q'), 20), ((29, 'r'), 20), ((29, 's'), 20), ((29, 't'), 20), ((29, 'u'), 46), ((29, 'v'), 20), ((29, 'w'), 20), ((29, 'x'), 20), ((29, 'y'), 20), ((29, 'z'), 20)
            , ((30, '0'), 20), ((30, '1'), 20), ((30, '2'), 20), ((30, '3'), 20), ((30, '4'), 20), ((30, '5'), 20), ((30, '6'), 20), ((30, '7'), 20), ((30, '8'), 20), ((30, '9'), 20), ((30, 'A'), 20), ((30, 'B'), 20), ((30, 'C'), 20), ((30, 'D'), 20), ((30, 'E'), 20), ((30, 'F'), 20), ((30, 'G'), 20), ((30, 'H'), 20), ((30, 'I'), 20), ((30, 'J'), 20), ((30, 'K'), 20), ((30, 'L'), 20), ((30, 'M'), 20), ((30, 'N'), 20), ((30, 'O'), 20), ((30, 'P'), 20), ((30, 'Q'), 20), ((30, 'R'), 20), ((30, 'S'), 20), ((30, 'T'), 20), ((30, 'U'), 20), ((30, 'V'), 20), ((30, 'W'), 20), ((30, 'X'), 20), ((30, 'Y'), 20), ((30, 'Z'), 20), ((30, '_'), 20), ((30, 'a'), 20), ((30, 'b'), 20), ((30, 'c'), 20), ((30, 'd'), 20), ((30, 'e'), 20), ((30, 'f'), 20), ((30, 'g'), 20), ((30, 'h'), 20), ((30, 'i'), 20), ((30, 'j'), 20), ((30, 'k'), 20), ((30, 'l'), 20), ((30, 'm'), 20), ((30, 'n'), 20), ((30, 'o'), 20), ((30, 'p'), 49), ((30, 'q'), 20), ((30, 'r'), 20), ((30, 's'), 20), ((30, 't'), 20), ((30, 'u'), 20), ((30, 'v'), 20), ((30, 'w'), 20), ((30, 'x'), 20), ((30, 'y'), 20), ((30, 'z'), 20)
            , ((31, '0'), 20), ((31, '1'), 20), ((31, '2'), 20), ((31, '3'), 20), ((31, '4'), 20), ((31, '5'), 20), ((31, '6'), 20), ((31, '7'), 20), ((31, '8'), 20), ((31, '9'), 20), ((31, 'A'), 20), ((31, 'B'), 20), ((31, 'C'), 20), ((31, 'D'), 20), ((31, 'E'), 20), ((31, 'F'), 20), ((31, 'G'), 20), ((31, 'H'), 20), ((31, 'I'), 20), ((31, 'J'), 20), ((31, 'K'), 20), ((31, 'L'), 20), ((31, 'M'), 20), ((31, 'N'), 20), ((31, 'O'), 20), ((31, 'P'), 20), ((31, 'Q'), 20), ((31, 'R'), 20), ((31, 'S'), 20), ((31, 'T'), 20), ((31, 'U'), 20), ((31, 'V'), 20), ((31, 'W'), 20), ((31, 'X'), 20), ((31, 'Y'), 20), ((31, 'Z'), 20), ((31, '_'), 20), ((31, 'a'), 20), ((31, 'b'), 20), ((31, 'c'), 20), ((31, 'd'), 20), ((31, 'e'), 20), ((31, 'f'), 20), ((31, 'g'), 20), ((31, 'h'), 20), ((31, 'i'), 47), ((31, 'j'), 20), ((31, 'k'), 20), ((31, 'l'), 20), ((31, 'm'), 20), ((31, 'n'), 20), ((31, 'o'), 20), ((31, 'p'), 20), ((31, 'q'), 20), ((31, 'r'), 20), ((31, 's'), 20), ((31, 't'), 20), ((31, 'u'), 20), ((31, 'v'), 20), ((31, 'w'), 20), ((31, 'x'), 20), ((31, 'y'), 20), ((31, 'z'), 20)
            , ((32, '0'), 20), ((32, '1'), 20), ((32, '2'), 20), ((32, '3'), 20), ((32, '4'), 20), ((32, '5'), 20), ((32, '6'), 20), ((32, '7'), 20), ((32, '8'), 20), ((32, '9'), 20), ((32, 'A'), 20), ((32, 'B'), 20), ((32, 'C'), 20), ((32, 'D'), 20), ((32, 'E'), 20), ((32, 'F'), 20), ((32, 'G'), 20), ((32, 'H'), 20), ((32, 'I'), 20), ((32, 'J'), 20), ((32, 'K'), 20), ((32, 'L'), 20), ((32, 'M'), 20), ((32, 'N'), 20), ((32, 'O'), 20), ((32, 'P'), 20), ((32, 'Q'), 20), ((32, 'R'), 20), ((32, 'S'), 20), ((32, 'T'), 20), ((32, 'U'), 20), ((32, 'V'), 20), ((32, 'W'), 20), ((32, 'X'), 20), ((32, 'Y'), 20), ((32, 'Z'), 20), ((32, '_'), 20), ((32, 'a'), 20), ((32, 'b'), 20), ((32, 'c'), 20), ((32, 'd'), 20), ((32, 'e'), 20), ((32, 'f'), 20), ((32, 'g'), 20), ((32, 'h'), 20), ((32, 'i'), 20), ((32, 'j'), 20), ((32, 'k'), 20), ((32, 'l'), 20), ((32, 'm'), 20), ((32, 'n'), 48), ((32, 'o'), 20), ((32, 'p'), 20), ((32, 'q'), 20), ((32, 'r'), 20), ((32, 's'), 20), ((32, 't'), 20), ((32, 'u'), 20), ((32, 'v'), 20), ((32, 'w'), 20), ((32, 'x'), 20), ((32, 'y'), 20), ((32, 'z'), 20)
            , ((34, ' '), 34), ((34, '!'), 34), ((34, '"'), 34), ((34, '#'), 34), ((34, '$'), 34), ((34, '%'), 34), ((34, '&'), 34), ((34, '\''), 34), ((34, '('), 34), ((34, ')'), 34), ((34, '*'), 34), ((34, '+'), 34), ((34, ','), 34), ((34, '-'), 34), ((34, '.'), 34), ((34, '/'), 34), ((34, '0'), 34), ((34, '1'), 34), ((34, '2'), 34), ((34, '3'), 34), ((34, '4'), 34), ((34, '5'), 34), ((34, '6'), 34), ((34, '7'), 34), ((34, '8'), 34), ((34, '9'), 34), ((34, ':'), 34), ((34, ';'), 34), ((34, '<'), 34), ((34, '='), 34), ((34, '>'), 34), ((34, '?'), 34), ((34, '@'), 34), ((34, 'A'), 34), ((34, 'B'), 34), ((34, 'C'), 34), ((34, 'D'), 34), ((34, 'E'), 34), ((34, 'F'), 34), ((34, 'G'), 34), ((34, 'H'), 34), ((34, 'I'), 34), ((34, 'J'), 34), ((34, 'K'), 34), ((34, 'L'), 34), ((34, 'M'), 34), ((34, 'N'), 34), ((34, 'O'), 34), ((34, 'P'), 34), ((34, 'Q'), 34), ((34, 'R'), 34), ((34, 'S'), 34), ((34, 'T'), 34), ((34, 'U'), 34), ((34, 'V'), 34), ((34, 'W'), 34), ((34, 'X'), 34), ((34, 'Y'), 34), ((34, 'Z'), 34), ((34, '['), 34), ((34, '\\'), 34), ((34, ']'), 34), ((34, '^'), 34), ((34, '_'), 34), ((34, '`'), 34), ((34, 'a'), 34), ((34, 'b'), 34), ((34, 'c'), 34), ((34, 'd'), 34), ((34, 'e'), 34), ((34, 'f'), 34), ((34, 'g'), 34), ((34, 'h'), 34), ((34, 'i'), 34), ((34, 'j'), 34), ((34, 'k'), 34), ((34, 'l'), 34), ((34, 'm'), 34), ((34, 'n'), 34), ((34, 'o'), 34), ((34, 'p'), 34), ((34, 'q'), 34), ((34, 'r'), 34), ((34, 's'), 34), ((34, 't'), 34), ((34, 'u'), 34), ((34, 'v'), 34), ((34, 'w'), 34), ((34, 'x'), 34), ((34, 'y'), 34), ((34, 'z'), 34), ((34, '{'), 34), ((34, '|'), 34), ((34, '}'), 34), ((34, '~'), 34)
            , ((42, '"'), 3), ((42, '\''), 3), ((42, '\\'), 3), ((42, 'n'), 3), ((42, 't'), 3)
            , ((43, '\''), 56)
            , ((44, '"'), 43), ((44, '\''), 43), ((44, '\\'), 43), ((44, 'n'), 43), ((44, 't'), 43)
            , ((45, '0'), 20), ((45, '1'), 20), ((45, '2'), 20), ((45, '3'), 20), ((45, '4'), 20), ((45, '5'), 20), ((45, '6'), 20), ((45, '7'), 20), ((45, '8'), 20), ((45, '9'), 20), ((45, 'A'), 20), ((45, 'B'), 20), ((45, 'C'), 20), ((45, 'D'), 20), ((45, 'E'), 20), ((45, 'F'), 20), ((45, 'G'), 20), ((45, 'H'), 20), ((45, 'I'), 20), ((45, 'J'), 20), ((45, 'K'), 20), ((45, 'L'), 20), ((45, 'M'), 20), ((45, 'N'), 20), ((45, 'O'), 20), ((45, 'P'), 20), ((45, 'Q'), 20), ((45, 'R'), 20), ((45, 'S'), 20), ((45, 'T'), 20), ((45, 'U'), 20), ((45, 'V'), 20), ((45, 'W'), 20), ((45, 'X'), 20), ((45, 'Y'), 20), ((45, 'Z'), 20), ((45, '_'), 20), ((45, 'a'), 20), ((45, 'b'), 20), ((45, 'c'), 20), ((45, 'd'), 20), ((45, 'e'), 20), ((45, 'f'), 20), ((45, 'g'), 20), ((45, 'h'), 20), ((45, 'i'), 20), ((45, 'j'), 20), ((45, 'k'), 20), ((45, 'l'), 20), ((45, 'm'), 62), ((45, 'n'), 20), ((45, 'o'), 20), ((45, 'p'), 20), ((45, 'q'), 20), ((45, 'r'), 20), ((45, 's'), 20), ((45, 't'), 20), ((45, 'u'), 20), ((45, 'v'), 20), ((45, 'w'), 20), ((45, 'x'), 20), ((45, 'y'), 20), ((45, 'z'), 20)
            , ((46, '0'), 20), ((46, '1'), 20), ((46, '2'), 20), ((46, '3'), 20), ((46, '4'), 20), ((46, '5'), 20), ((46, '6'), 20), ((46, '7'), 20), ((46, '8'), 20), ((46, '9'), 20), ((46, 'A'), 20), ((46, 'B'), 20), ((46, 'C'), 20), ((46, 'D'), 20), ((46, 'E'), 20), ((46, 'F'), 20), ((46, 'G'), 20), ((46, 'H'), 20), ((46, 'I'), 20), ((46, 'J'), 20), ((46, 'K'), 20), ((46, 'L'), 20), ((46, 'M'), 20), ((46, 'N'), 20), ((46, 'O'), 20), ((46, 'P'), 20), ((46, 'Q'), 20), ((46, 'R'), 20), ((46, 'S'), 20), ((46, 'T'), 20), ((46, 'U'), 20), ((46, 'V'), 20), ((46, 'W'), 20), ((46, 'X'), 20), ((46, 'Y'), 20), ((46, 'Z'), 20), ((46, '_'), 20), ((46, 'a'), 20), ((46, 'b'), 20), ((46, 'c'), 20), ((46, 'd'), 20), ((46, 'e'), 63), ((46, 'f'), 20), ((46, 'g'), 20), ((46, 'h'), 20), ((46, 'i'), 20), ((46, 'j'), 20), ((46, 'k'), 20), ((46, 'l'), 20), ((46, 'm'), 20), ((46, 'n'), 20), ((46, 'o'), 20), ((46, 'p'), 20), ((46, 'q'), 20), ((46, 'r'), 20), ((46, 's'), 20), ((46, 't'), 20), ((46, 'u'), 20), ((46, 'v'), 20), ((46, 'w'), 20), ((46, 'x'), 20), ((46, 'y'), 20), ((46, 'z'), 20)
            , ((47, '0'), 20), ((47, '1'), 20), ((47, '2'), 20), ((47, '3'), 20), ((47, '4'), 20), ((47, '5'), 20), ((47, '6'), 20), ((47, '7'), 20), ((47, '8'), 20), ((47, '9'), 20), ((47, 'A'), 20), ((47, 'B'), 20), ((47, 'C'), 20), ((47, 'D'), 20), ((47, 'E'), 20), ((47, 'F'), 20), ((47, 'G'), 20), ((47, 'H'), 20), ((47, 'I'), 20), ((47, 'J'), 20), ((47, 'K'), 20), ((47, 'L'), 20), ((47, 'M'), 20), ((47, 'N'), 20), ((47, 'O'), 20), ((47, 'P'), 20), ((47, 'Q'), 20), ((47, 'R'), 20), ((47, 'S'), 20), ((47, 'T'), 20), ((47, 'U'), 20), ((47, 'V'), 20), ((47, 'W'), 20), ((47, 'X'), 20), ((47, 'Y'), 20), ((47, 'Z'), 20), ((47, '_'), 20), ((47, 'a'), 20), ((47, 'b'), 20), ((47, 'c'), 20), ((47, 'd'), 20), ((47, 'e'), 20), ((47, 'f'), 20), ((47, 'g'), 20), ((47, 'h'), 20), ((47, 'i'), 20), ((47, 'j'), 20), ((47, 'k'), 20), ((47, 'l'), 64), ((47, 'm'), 20), ((47, 'n'), 20), ((47, 'o'), 20), ((47, 'p'), 20), ((47, 'q'), 20), ((47, 'r'), 20), ((47, 's'), 20), ((47, 't'), 20), ((47, 'u'), 20), ((47, 'v'), 20), ((47, 'w'), 20), ((47, 'x'), 20), ((47, 'y'), 20), ((47, 'z'), 20)
            , ((48, '0'), 20), ((48, '1'), 20), ((48, '2'), 20), ((48, '3'), 20), ((48, '4'), 20), ((48, '5'), 20), ((48, '6'), 20), ((48, '7'), 20), ((48, '8'), 20), ((48, '9'), 20), ((48, 'A'), 20), ((48, 'B'), 20), ((48, 'C'), 20), ((48, 'D'), 20), ((48, 'E'), 20), ((48, 'F'), 20), ((48, 'G'), 20), ((48, 'H'), 20), ((48, 'I'), 20), ((48, 'J'), 20), ((48, 'K'), 20), ((48, 'L'), 20), ((48, 'M'), 20), ((48, 'N'), 20), ((48, 'O'), 20), ((48, 'P'), 20), ((48, 'Q'), 20), ((48, 'R'), 20), ((48, 'S'), 20), ((48, 'T'), 20), ((48, 'U'), 20), ((48, 'V'), 20), ((48, 'W'), 20), ((48, 'X'), 20), ((48, 'Y'), 20), ((48, 'Z'), 20), ((48, '_'), 20), ((48, 'a'), 20), ((48, 'b'), 20), ((48, 'c'), 20), ((48, 'd'), 65), ((48, 'e'), 20), ((48, 'f'), 20), ((48, 'g'), 20), ((48, 'h'), 20), ((48, 'i'), 20), ((48, 'j'), 20), ((48, 'k'), 20), ((48, 'l'), 20), ((48, 'm'), 20), ((48, 'n'), 20), ((48, 'o'), 20), ((48, 'p'), 20), ((48, 'q'), 20), ((48, 'r'), 20), ((48, 's'), 20), ((48, 't'), 20), ((48, 'u'), 20), ((48, 'v'), 20), ((48, 'w'), 20), ((48, 'x'), 20), ((48, 'y'), 20), ((48, 'z'), 20)
            , ((49, '0'), 20), ((49, '1'), 20), ((49, '2'), 20), ((49, '3'), 20), ((49, '4'), 20), ((49, '5'), 20), ((49, '6'), 20), ((49, '7'), 20), ((49, '8'), 20), ((49, '9'), 20), ((49, 'A'), 20), ((49, 'B'), 20), ((49, 'C'), 20), ((49, 'D'), 20), ((49, 'E'), 20), ((49, 'F'), 20), ((49, 'G'), 20), ((49, 'H'), 20), ((49, 'I'), 20), ((49, 'J'), 20), ((49, 'K'), 20), ((49, 'L'), 20), ((49, 'M'), 20), ((49, 'N'), 20), ((49, 'O'), 20), ((49, 'P'), 20), ((49, 'Q'), 20), ((49, 'R'), 20), ((49, 'S'), 20), ((49, 'T'), 20), ((49, 'U'), 20), ((49, 'V'), 20), ((49, 'W'), 20), ((49, 'X'), 20), ((49, 'Y'), 20), ((49, 'Z'), 20), ((49, '_'), 20), ((49, 'a'), 20), ((49, 'b'), 20), ((49, 'c'), 20), ((49, 'd'), 20), ((49, 'e'), 66), ((49, 'f'), 20), ((49, 'g'), 20), ((49, 'h'), 20), ((49, 'i'), 20), ((49, 'j'), 20), ((49, 'k'), 20), ((49, 'l'), 20), ((49, 'm'), 20), ((49, 'n'), 20), ((49, 'o'), 20), ((49, 'p'), 20), ((49, 'q'), 20), ((49, 'r'), 20), ((49, 's'), 20), ((49, 't'), 20), ((49, 'u'), 20), ((49, 'v'), 20), ((49, 'w'), 20), ((49, 'x'), 20), ((49, 'y'), 20), ((49, 'z'), 20)
            , ((62, '0'), 20), ((62, '1'), 20), ((62, '2'), 20), ((62, '3'), 20), ((62, '4'), 20), ((62, '5'), 20), ((62, '6'), 20), ((62, '7'), 20), ((62, '8'), 20), ((62, '9'), 20), ((62, 'A'), 20), ((62, 'B'), 20), ((62, 'C'), 20), ((62, 'D'), 20), ((62, 'E'), 20), ((62, 'F'), 20), ((62, 'G'), 20), ((62, 'H'), 20), ((62, 'I'), 20), ((62, 'J'), 20), ((62, 'K'), 20), ((62, 'L'), 20), ((62, 'M'), 20), ((62, 'N'), 20), ((62, 'O'), 20), ((62, 'P'), 20), ((62, 'Q'), 20), ((62, 'R'), 20), ((62, 'S'), 20), ((62, 'T'), 20), ((62, 'U'), 20), ((62, 'V'), 20), ((62, 'W'), 20), ((62, 'X'), 20), ((62, 'Y'), 20), ((62, 'Z'), 20), ((62, '_'), 20), ((62, 'a'), 67), ((62, 'b'), 20), ((62, 'c'), 20), ((62, 'd'), 20), ((62, 'e'), 20), ((62, 'f'), 20), ((62, 'g'), 20), ((62, 'h'), 20), ((62, 'i'), 20), ((62, 'j'), 20), ((62, 'k'), 20), ((62, 'l'), 20), ((62, 'm'), 20), ((62, 'n'), 20), ((62, 'o'), 20), ((62, 'p'), 20), ((62, 'q'), 20), ((62, 'r'), 20), ((62, 's'), 20), ((62, 't'), 20), ((62, 'u'), 20), ((62, 'v'), 20), ((62, 'w'), 20), ((62, 'x'), 20), ((62, 'y'), 20), ((62, 'z'), 20)
            , ((63, '0'), 20), ((63, '1'), 20), ((63, '2'), 20), ((63, '3'), 20), ((63, '4'), 20), ((63, '5'), 20), ((63, '6'), 20), ((63, '7'), 20), ((63, '8'), 20), ((63, '9'), 20), ((63, 'A'), 20), ((63, 'B'), 20), ((63, 'C'), 20), ((63, 'D'), 20), ((63, 'E'), 20), ((63, 'F'), 20), ((63, 'G'), 20), ((63, 'H'), 20), ((63, 'I'), 20), ((63, 'J'), 20), ((63, 'K'), 20), ((63, 'L'), 20), ((63, 'M'), 20), ((63, 'N'), 20), ((63, 'O'), 20), ((63, 'P'), 20), ((63, 'Q'), 20), ((63, 'R'), 20), ((63, 'S'), 20), ((63, 'T'), 20), ((63, 'U'), 20), ((63, 'V'), 20), ((63, 'W'), 20), ((63, 'X'), 20), ((63, 'Y'), 20), ((63, 'Z'), 20), ((63, '_'), 20), ((63, 'a'), 20), ((63, 'b'), 20), ((63, 'c'), 20), ((63, 'd'), 20), ((63, 'e'), 20), ((63, 'f'), 20), ((63, 'g'), 20), ((63, 'h'), 20), ((63, 'i'), 20), ((63, 'j'), 20), ((63, 'k'), 20), ((63, 'l'), 20), ((63, 'm'), 20), ((63, 'n'), 20), ((63, 'o'), 20), ((63, 'p'), 20), ((63, 'q'), 20), ((63, 'r'), 20), ((63, 's'), 20), ((63, 't'), 20), ((63, 'u'), 20), ((63, 'v'), 20), ((63, 'w'), 20), ((63, 'x'), 20), ((63, 'y'), 20), ((63, 'z'), 20)
            , ((64, '0'), 20), ((64, '1'), 20), ((64, '2'), 20), ((64, '3'), 20), ((64, '4'), 20), ((64, '5'), 20), ((64, '6'), 20), ((64, '7'), 20), ((64, '8'), 20), ((64, '9'), 20), ((64, 'A'), 20), ((64, 'B'), 20), ((64, 'C'), 20), ((64, 'D'), 20), ((64, 'E'), 20), ((64, 'F'), 20), ((64, 'G'), 20), ((64, 'H'), 20), ((64, 'I'), 20), ((64, 'J'), 20), ((64, 'K'), 20), ((64, 'L'), 20), ((64, 'M'), 20), ((64, 'N'), 20), ((64, 'O'), 20), ((64, 'P'), 20), ((64, 'Q'), 20), ((64, 'R'), 20), ((64, 'S'), 20), ((64, 'T'), 20), ((64, 'U'), 20), ((64, 'V'), 20), ((64, 'W'), 20), ((64, 'X'), 20), ((64, 'Y'), 20), ((64, 'Z'), 20), ((64, '_'), 20), ((64, 'a'), 20), ((64, 'b'), 20), ((64, 'c'), 20), ((64, 'd'), 20), ((64, 'e'), 20), ((64, 'f'), 20), ((64, 'g'), 20), ((64, 'h'), 20), ((64, 'i'), 20), ((64, 'j'), 20), ((64, 'k'), 20), ((64, 'l'), 20), ((64, 'm'), 20), ((64, 'n'), 20), ((64, 'o'), 20), ((64, 'p'), 20), ((64, 'q'), 20), ((64, 'r'), 20), ((64, 's'), 20), ((64, 't'), 20), ((64, 'u'), 20), ((64, 'v'), 20), ((64, 'w'), 20), ((64, 'x'), 20), ((64, 'y'), 20), ((64, 'z'), 20)
            , ((65, '0'), 20), ((65, '1'), 20), ((65, '2'), 20), ((65, '3'), 20), ((65, '4'), 20), ((65, '5'), 20), ((65, '6'), 20), ((65, '7'), 20), ((65, '8'), 20), ((65, '9'), 20), ((65, 'A'), 20), ((65, 'B'), 20), ((65, 'C'), 20), ((65, 'D'), 20), ((65, 'E'), 20), ((65, 'F'), 20), ((65, 'G'), 20), ((65, 'H'), 20), ((65, 'I'), 20), ((65, 'J'), 20), ((65, 'K'), 20), ((65, 'L'), 20), ((65, 'M'), 20), ((65, 'N'), 20), ((65, 'O'), 20), ((65, 'P'), 20), ((65, 'Q'), 20), ((65, 'R'), 20), ((65, 'S'), 20), ((65, 'T'), 20), ((65, 'U'), 20), ((65, 'V'), 20), ((65, 'W'), 20), ((65, 'X'), 20), ((65, 'Y'), 20), ((65, 'Z'), 20), ((65, '_'), 20), ((65, 'a'), 20), ((65, 'b'), 20), ((65, 'c'), 20), ((65, 'd'), 20), ((65, 'e'), 20), ((65, 'f'), 20), ((65, 'g'), 20), ((65, 'h'), 20), ((65, 'i'), 20), ((65, 'j'), 20), ((65, 'k'), 20), ((65, 'l'), 20), ((65, 'm'), 20), ((65, 'n'), 20), ((65, 'o'), 20), ((65, 'p'), 20), ((65, 'q'), 20), ((65, 'r'), 20), ((65, 's'), 20), ((65, 't'), 20), ((65, 'u'), 20), ((65, 'v'), 20), ((65, 'w'), 20), ((65, 'x'), 20), ((65, 'y'), 20), ((65, 'z'), 20)
            , ((66, '0'), 20), ((66, '1'), 20), ((66, '2'), 20), ((66, '3'), 20), ((66, '4'), 20), ((66, '5'), 20), ((66, '6'), 20), ((66, '7'), 20), ((66, '8'), 20), ((66, '9'), 20), ((66, 'A'), 20), ((66, 'B'), 20), ((66, 'C'), 20), ((66, 'D'), 20), ((66, 'E'), 20), ((66, 'F'), 20), ((66, 'G'), 20), ((66, 'H'), 20), ((66, 'I'), 20), ((66, 'J'), 20), ((66, 'K'), 20), ((66, 'L'), 20), ((66, 'M'), 20), ((66, 'N'), 20), ((66, 'O'), 20), ((66, 'P'), 20), ((66, 'Q'), 20), ((66, 'R'), 20), ((66, 'S'), 20), ((66, 'T'), 20), ((66, 'U'), 20), ((66, 'V'), 20), ((66, 'W'), 20), ((66, 'X'), 20), ((66, 'Y'), 20), ((66, 'Z'), 20), ((66, '_'), 20), ((66, 'a'), 20), ((66, 'b'), 20), ((66, 'c'), 20), ((66, 'd'), 20), ((66, 'e'), 20), ((66, 'f'), 20), ((66, 'g'), 20), ((66, 'h'), 20), ((66, 'i'), 20), ((66, 'j'), 20), ((66, 'k'), 20), ((66, 'l'), 20), ((66, 'm'), 20), ((66, 'n'), 20), ((66, 'o'), 20), ((66, 'p'), 20), ((66, 'q'), 20), ((66, 'r'), 20), ((66, 's'), 20), ((66, 't'), 20), ((66, 'u'), 20), ((66, 'v'), 20), ((66, 'w'), 20), ((66, 'x'), 20), ((66, 'y'), 20), ((66, 'z'), 20)
            , ((67, '0'), 20), ((67, '1'), 20), ((67, '2'), 20), ((67, '3'), 20), ((67, '4'), 20), ((67, '5'), 20), ((67, '6'), 20), ((67, '7'), 20), ((67, '8'), 20), ((67, '9'), 20), ((67, 'A'), 20), ((67, 'B'), 20), ((67, 'C'), 20), ((67, 'D'), 20), ((67, 'E'), 20), ((67, 'F'), 20), ((67, 'G'), 20), ((67, 'H'), 20), ((67, 'I'), 20), ((67, 'J'), 20), ((67, 'K'), 20), ((67, 'L'), 20), ((67, 'M'), 20), ((67, 'N'), 20), ((67, 'O'), 20), ((67, 'P'), 20), ((67, 'Q'), 20), ((67, 'R'), 20), ((67, 'S'), 20), ((67, 'T'), 20), ((67, 'U'), 20), ((67, 'V'), 20), ((67, 'W'), 20), ((67, 'X'), 20), ((67, 'Y'), 20), ((67, 'Z'), 20), ((67, '_'), 20), ((67, 'a'), 20), ((67, 'b'), 20), ((67, 'c'), 20), ((67, 'd'), 20), ((67, 'e'), 20), ((67, 'f'), 20), ((67, 'g'), 20), ((67, 'h'), 20), ((67, 'i'), 20), ((67, 'j'), 20), ((67, 'k'), 20), ((67, 'l'), 20), ((67, 'm'), 20), ((67, 'n'), 20), ((67, 'o'), 20), ((67, 'p'), 20), ((67, 'q'), 20), ((67, 'r'), 20), ((67, 's'), 20), ((67, 't'), 20), ((67, 'u'), 20), ((67, 'v'), 20), ((67, 'w'), 20), ((67, 'x'), 20), ((67, 'y'), 20), ((67, 'z'), 20)
            ]
        , getMarkedQsOfDFA = XMap.fromAscList []
        }
    runDFA :: DFA -> (ch -> Char) -> [ch] -> ((Maybe Int, [ch]), [ch])
    runDFA (DFA q0 qfs deltas markeds) toChar = XIdentity.runIdentity . go where
        loop1 q buffer [] = return buffer
        loop1 q buffer (ch : str) = do
            case XMap.lookup (q, toChar ch) deltas of
                Nothing -> return (buffer ++ [ch] ++ str)
                Just p -> case XMap.lookup p qfs of
                    Nothing -> loop1 p (buffer ++ [ch]) str
                    latest' -> do
                        (latest, accepted) <- XState.get
                        XState.put (latest', accepted ++ buffer ++ [ch])
                        loop1 p [] str
        loop2 qs q [] buffer = return buffer
        loop2 qs q (ch : str) buffer = do
            case XMap.lookup (q, toChar ch) deltas of
                Nothing -> return (buffer ++ [ch] ++ str)
                Just p -> case p `XSet.member` qs of
                    False -> loop2 qs p str (buffer ++ [ch])
                    True -> do
                        accepted <- XState.get
                        XState.put (accepted ++ buffer ++ [ch])
                        loop2 qs p str []
        go input = do
            (rest, (latest, accepted)) <- XState.runStateT (loop1 q0 [] input) (Nothing, [])
            case latest >>= flip XMap.lookup markeds of
                Nothing -> return ((latest, accepted), rest)
                Just qs -> do
                    (rest', accepted') <- XState.runStateT (loop2 qs q0 accepted []) []
                    return ((latest, accepted'), rest' ++ rest)
    addLoc :: Int -> Int -> String -> [((Int, Int), Char)]
    addLoc _ _ [] = []
    addLoc row col (ch : chs) = if ch == '\n' then ((row, col), ch) : addLoc (row + 1) 1 chs else ((row, col), ch) : addLoc row (col + 1) chs
    doLexing :: [((Int, Int), Char)] -> Either (Int, Int) [Token]
    doLexing [] = return []
    doLexing str0 = do
        let returnJust = return . Just
        (str1, piece) <- case runDFA theDFA snd str0 of
            ((_, []), _) -> Left (fst (head str0))
            ((Just label, accepted), rest) -> return (rest, ((label, map snd accepted), (fst (head accepted), fst (head (reverse accepted)))))
            _ -> Left (fst (head str0))
        maybe_token <- case piece of
            ((1, this), ((row1, col1), (row2, col2))) -> returnJust (T_dot (SLoc (row1, col1) (row2, col2)))
            ((2, this), ((row1, col1), (row2, col2))) -> returnJust (T_arrow (SLoc (row1, col1) (row2, col2)))
            ((3, this), ((row1, col1), (row2, col2))) -> returnJust (T_fatarrow (SLoc (row1, col1) (row2, col2)))
            ((4, this), ((row1, col1), (row2, col2))) -> returnJust (T_lparen (SLoc (row1, col1) (row2, col2)))
            ((5, this), ((row1, col1), (row2, col2))) -> returnJust (T_rparen (SLoc (row1, col1) (row2, col2)))
            ((6, this), ((row1, col1), (row2, col2))) -> returnJust (T_lbracket (SLoc (row1, col1) (row2, col2)))
            ((7, this), ((row1, col1), (row2, col2))) -> returnJust (T_rbracket (SLoc (row1, col1) (row2, col2)))
            ((8, this), ((row1, col1), (row2, col2))) -> returnJust (T_quest (SLoc (row1, col1) (row2, col2)))
            ((9, this), ((row1, col1), (row2, col2))) -> returnJust (T_comma (SLoc (row1, col1) (row2, col2)))
            ((10, this), ((row1, col1), (row2, col2))) -> returnJust (T_fatarrow (SLoc (row1, col1) (row2, col2)))
            ((11, this), ((row1, col1), (row2, col2))) -> returnJust (T_if (SLoc (row1, col1) (row2, col2)))
            ((12, this), ((row1, col1), (row2, col2))) -> returnJust (T_succ (SLoc (row1, col1) (row2, col2)))
            ((13, this), ((row1, col1), (row2, col2))) -> returnJust (T_pi (SLoc (row1, col1) (row2, col2)))
            ((14, this), ((row1, col1), (row2, col2))) -> returnJust (T_sigma (SLoc (row1, col1) (row2, col2)))
            ((15, this), ((row1, col1), (row2, col2))) -> returnJust (T_cut (SLoc (row1, col1) (row2, col2)))
            ((16, this), ((row1, col1), (row2, col2))) -> returnJust (T_true (SLoc (row1, col1) (row2, col2)))
            ((17, this), ((row1, col1), (row2, col2))) -> returnJust (T_fail (SLoc (row1, col1) (row2, col2)))
            ((18, this), ((row1, col1), (row2, col2))) -> returnJust (T_bslash (SLoc (row1, col1) (row2, col2)))
            ((19, this), ((row1, col1), (row2, col2))) -> returnJust (T_cons (SLoc (row1, col1) (row2, col2)))
            ((20, this), ((row1, col1), (row2, col2))) -> returnJust (T_kind (SLoc (row1, col1) (row2, col2)))
            ((21, this), ((row1, col1), (row2, col2))) -> returnJust (T_type (SLoc (row1, col1) (row2, col2)))
            ((22, this), ((row1, col1), (row2, col2))) -> returnJust (T_smallid (SLoc (row1, col1) (row2, col2)) this)
            ((23, this), ((row1, col1), (row2, col2))) -> returnJust (T_largeid (SLoc (row1, col1) (row2, col2)) this)
            ((24, this), ((row1, col1), (row2, col2))) -> returnJust (T_nat_lit (SLoc (row1, col1) (row2, col2)) (read this))
            ((25, this), ((row1, col1), (row2, col2))) -> returnJust (T_str_lit (SLoc (row1, col1) (row2, col2)) (read this))
            ((26, this), ((row1, col1), (row2, col2))) -> returnJust (T_chr_lit (SLoc (row1, col1) (row2, col2)) (read this))
            ((27, this), ((row1, col1), (row2, col2))) -> return Nothing
            ((28, this), ((row1, col1), (row2, col2))) -> return Nothing
        fmap (maybe id (:) maybe_token) (doLexing str1)

