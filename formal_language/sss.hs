import Data.Set (Set)
import qualified Data.Set as Set

-- the base set is 3 (this is s 1),
-- the set of Nums from this base set is 9
-- the set of ifs from this base set is 27
-- for a total of 39 (this is s 2)
-- On the next round our previous set we have 39 terms avail
-- So for (s 3) we have 3*39 nums
-- and to make the Ifs we have 39*39*39 possible combinations
-- so 3*39 = 117 39^3 = 59319 for a total of 59436 (then add in the extra 3)
-- 3								(s 1)
-- 3 + 3*3 + 3*3*3 = 3 + 3*|s 1| + |s 1|^3 = 39			(s 2)
-- 3 + 3*|s 2| + |s 2|^3 = 59439				(s 3)
-- 3 + 3*|s 3| + |s 3|^3					(s 4)
-- (the definition always includes the base set of 3 but as
-- this is a set, it doesn't add to the cardinality.)

-- Did this both as a set and as a list

x1 = 3
x2 = 3 + 3*3 + 3*3*3
x3 = 3 + (3 + 3*3 + 3*3*3)*3 + (3 + 3*3 + 3*3*3)^3
x4 = 3 + (3 + (3 + 3*3 + 3*3*3)*3 + (3 + 3*3 + 3*3*3)^3)*3 + (3 + (3 + 3*3 + 3*3*3)*3 + (3 + 3*3 + 3*3*3)^3)^3

subset [] _ = True
subset (x:xs) t = elem x t  && subset xs t

-- Proof s_i subset s_{i+1} for all i
-- bc: s 0 subset s 1 (since empty set subset of all sets)
--     s 1 subset s 2
--     s 1 = [S 't', S 'f', S '0'], and
--     s 2 = Set.union (s 1) $ Set.union (makeNum (s 1)) (makeIf (s 1))
--		so by definition of union s 1 subset of s 2
-- assume for k <= n that s k-1 subset s k
-- Now prove for k+1
-- 	s (k-1) subset s k	(IH)
--	s (k+1) =  s0 U (makeNum s') U  (makeIf s' )
--     		where
-- 	 		s' = s (k)
-- Now s' is covered by the induction hypothesis, so
--	the subset relation holds for all sets constructed in the process
--	of constucting s': s 0 subset s 1 subset ... subset s k
-- 	So the only new elements introduced are the ones by the recursive
--	rules so s k subset s (k+1). How do we know we didn't "lose" some
--	term?  Since (s k) contains all the terms produced by
--	(s (k-1)) ... (s 0), at each iteration of the recursive rule
--	we are applying the recursive rule to all the previously
--	generated terms. For any term t_i generated after i applications
--	of the recursive rule and so in s i, t_i is also in s_(i+1)
--	(all the way up to s_k, by the IH). So in the (k+1)th application
--	of the recursive rule we are applying it to terms generated in (s 0)
--	(giving us all the terms in (s 1), then to terms generated in (s 1)
--	(giving us all the terms in (s 2), etc. up to the terms generated
--	in the k'th iteration. Therefore we "regenerate" all the terms
--	from the previous k'th iteration in constructing the k+1'th, except
--	for the (s 1) -- which got wiped out in the recursvie rule. And
--	since we "wiped out" the s1 elements in the recursive application,
--	we union them back in.

-- Or use a rewriting approach.
-- (ignore s 0 since it's just the empty set)
-- and let's capture the recursive step with a map C elements
-- s1 = [t,f,0]
-- s2 = s1 U map C (elements s1) = s1 U map C [t,f,0]
-- s3 = s1 U map C (elements s2) = s1 U map C (s1 U map C [t,f,0])
-- s4 = s1 U map C (elements s3) = s1 U map C (s1 U map C (s1 U map C [t,f,0]))
-- Now let's name the recursive step with its 2 variants: N and M. N gives
-- us the (S,P,IZ) terms (3X for each term in previous set), and
-- M gives us the I terms (|terms|^3 for each term in the previous set)
-- s4 = s1 U map M (s1 U map M (s1 U map M [t,f,0])) 
--	U  map N (s1 U map N (s1 U map N [t,f,0]))
-- Now I'll "reduce" map M [t,f,0] to [M t, M f, M 0] etc. This isn't
-- exactly precise since each application of M gives us the 3 terms, etc.
-- but we could then flatten them into a flat list.
-- and recall that s1 = [t,f,0]
-- s4 = s1 U map M (s1 U map M (s1 U [M t,M f,M 0])) 
--	   U map N (s1 U map N (s1 U [N t,N f,N 0]))
-- s4 = s1 U map M (s1 U map M ([t,f,0] U [M t,M f,M 0])) 
--	   U map N (s1 U map N ([t,f,0] U [N t,N f,N 0]))
-- s4 = s1 U map M (s1 U ([M t,M f,M 0] U [M M t,M M f,M M 0])) 
--	   U map N (s1 U ([N t,N f,N 0] U [N N t,N N f,N N 0]))
-- s4 = s1 U ([M t,M f,M 0] U ([M M t,M M f,M M 0] U [M M M t,M M M f,M M M 0])) 
--	   U ([N t,N f,N 0] U ([N N t,N N f,N N 0] U [N N N t,N N N f,N N N 0]))
-- Since U is commutative and associative
-- we can rearrange (now note that s2 is one application of M and N union'ed
-- with s 1): s2 = s1 U [M t, M f, M 0] U [N t, N f, N 0].
-- So we can represent this more compactly with:
-- s4 = s1 U [M t, M f, M 0] U [N t, N f, N 0] U [M M t, M M f, M M 0]
--      U [N N t, N N f, N N 0] U [M M M t, M M M f, M M M 0] 
--	U [N N N t, N N N f, N N N 0]
-- OR
-- s4 = s1 U map M s1 U map N s1 U map M^2 s1 map N^2 s1 U map M^3 s1 U N^3 s1
-- OR is we let t n = map M
-- sn = s1 U map M s1 U map N s1 U ... U map M^(n-1) s1 U map N^(n-1) s1

num_elems 0 = 0
num_elems 1 = 3
num_elems n = 3 + (num_elems (n-1))*3 + (num_elems (n-1))^3

s1Count = 3
s2Count = s1Count + 3*s1Count + s1Count^3
s3Count = s1Count + 3*s2Count + s2Count^3
s4Count = s1Count + 3*s3Count + s3Count^ 3

data Val = Su Val | P Val | IZ Val | I Val Val Val | S Char
     deriving (Eq, Ord, Show)

s0 = [S 't', S 'f', S '0']

s 0 = Set.fromList ([]::[Val])
s 1 = Set.fromList s0
s 2 = Set.union (s 1) $ Set.union (makeNum (s 1)) (makeIf (s 1))
s 3 = Set.union (s 1) $ Set.union (makeNum (s 2)) (makeIf (s 2))
s 4 = Set.union (s 1) $ Set.union (makeNum (s 3)) (makeIf (s 3))

ss 0 = Set.fromList ([]::[Val])
ss 1 = Set.fromList s0
ss n =  Set.union (Set.fromList s0) $ Set.union  ( makeNum s')  (makeIf s' )
     where
     s' = ss (n-1)

makeTrips s = [(x,y,z) | x <- s, y <- s, z <- s]

makeIf s  = Set.fromList [I t1 t2 t3 | (t1,t2,t3)<-makeTrips e]
    where
        e = Set.elems s

makeNum s = Set.fromList $ flatten $  [(Su t1, P t1, IZ t1) | t1 <- e] 
    where
        e = Set.elems s

-- Recursive definition
-- Base case: t in V, f in V, 0 in V
-- if x in V then S x, P x, IZ in V
-- and if x1, x2, x3 in V then I x1 x2 x3 in V
-- closure

sss 0 = []
sss 1 = s0
sss n =  s0 ++  makeNum' s' ++ makeIf' s' 
     where
     s' = sss (n-1)

makeIf' s  = [I t1 t2 t3 | (t1,t2,t3)<-makeTrips s]

makeNum' s = flatten $  [(Su t1, P t1, IZ t1) | t1 <- s] 

flatten [] = []
flatten ((x,y,z):xs) = x:y:z:flatten xs

-- Main> Set.size (s 0)
-- 0
-- Main> Set.size (s 1)
-- 3
-- Main> Set.size (s 2)
-- 39
-- Main> Set.size (s 3)
-- 59439
-- Main> Set.size (ss 1)
-- 3
-- Main> Set.size (ss 2)
-- 39
-- Main> Set.size (ss 3)
-- 59439
-- Main> 
-- Main> s1Count
-- 3
-- Main> s2Count
-- 39
-- Main> s3Count
-- 59439
-- Main> 


