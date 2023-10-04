-- make a type alias with type: just give a new name to ONE type.
type Score = Int
-- make a algebraic datatype with data: give one name to (possibly) MULTIPLE types.
data Name = Const1 | Const2

data Contest = Rock | Scissors | Paper deriving Show

isRock Rock = True
isRock _ = False

rps :: Contest -> Contest -> String
rps Rock Rock = "Tie"
rps Rock Paper = "Player two wins!"
rps Rock Scissors = "Player one wins!"
rps Scissors Rock = "Player two wins!"
rps Scissors Paper = "Player one wins!"
rps Scissors Scissors = "Tie"
rps Paper Rock = "Player one wins!"
rps Paper Paper = "Tie"
rps Paper Scissors = "Player two wins!"
--rps x y = "Tie"

data Velocity = MPS Double | FPS Double deriving (Show, Eq)

asMPS :: Velocity -> Double
asMPS (MPS x) = x
asMPS (FPS x) = x * 0.3048

--data Point = Point Double Double deriving Show
type Point = (Double, Double)
data Shape = Circle Point Double | Rectangle Point Point deriving Show

area :: Shape -> Double
area (Circle center r) = pi * r^2
area (Rectangle (x1,y1) (x2,y2)) = abs $ (x2-x1)*(y2-y1)

unitCircle = Circle (0,0) 1
unitRectangle = Rectangle (1,0) (0,1)

perimeter :: Shape -> Double
perimeter (Circle (x,y) r) = 2 * pi * r
perimeter (Rectangle (x1,y1) (x2,y2)) = 2*(abs (x2-x1)+ abs (y2-y1))

bullsEye = map (Circle (0,0)) [1,2,3,4,5]
-- maybe nicer as map (\r -> Circle 0 0 r) [1,2,3,4,5]

data IntTsil = Snoc IntTsil Int | Llun deriving Show

tsilToList :: IntTsil -> [Int]
tsilToList (Snoc liat deah) = deah:(tsilToList liat)
tsilToList Llun = []

lengthTsil :: IntTsil -> Int
lengthTsil Llun = 0
lengthTsil (liat `Snoc` deah) = 1 + lengthTsil liat
