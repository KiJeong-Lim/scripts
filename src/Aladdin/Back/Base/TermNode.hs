module Aladdin.Back.Base.TermNode where

import Aladdin.Back.Base.Constant
import Data.Unique
import Lib.Base

type DeBruijn = Int

type SuspEnv = [SuspItem]

type IsTypeLevel = Bool

data LogicVar
    = LV_ty_var Unique
    | LV_Unique Unique
    | LV_Named Name
    deriving (Eq, Ord)

data TermNode
    = LVar LogicVar
    | NCon Constant
    | NIdx DeBruijn
    | NApp TermNode TermNode
    | NAbs TermNode
    | Susp
        { getSuspBody :: TermNode
        , getSuspOL :: Int
        , getSuspNL :: Int
        , getSuspEnv :: SuspEnv
        }
    deriving (Eq, Ord)

data SuspItem
    = Dummy Int
    | Binds TermNode Int
    deriving (Eq, Ord)

instance Show LogicVar where
    show = flip (showsPrec 0) ""
    showList = undefined
    showsPrec prec (LV_ty_var uni) = strstr "TV_" . showsPrec prec (hashUnique uni)
    showsPrec prec (LV_Unique uni) = strstr "V_" . showsPrec prec (hashUnique uni)
    showsPrec prec (LV_Named name) = strstr name

mkLVar :: LogicVar -> TermNode
mkLVar v = v `seq` LVar v

mkNCon :: Constant -> TermNode
mkNCon c = c `seq` NCon c

mkNIdx :: DeBruijn -> TermNode
mkNIdx i = i `seq` NIdx i

mkNApp :: TermNode -> TermNode -> TermNode
mkNApp t1 t2 = t1 `seq` t2 `seq` NApp t1 t2

mkNAbs :: TermNode -> TermNode
mkNAbs t = t `seq` NAbs t

mkSusp :: TermNode -> Int -> Int -> SuspEnv -> TermNode
mkSusp t 0 0 [] = t
mkSusp t ol nl (item : env) = t `seq` item `seq` Susp { getSuspBody = t, getSuspOL = ol, getSuspNL = nl, getSuspEnv = item : env }

mkDummy :: Int -> SuspItem
mkDummy l = l `seq` Dummy l

mkBinds :: TermNode -> Int -> SuspItem
mkBinds t l = t `seq` l `seq` Binds t l