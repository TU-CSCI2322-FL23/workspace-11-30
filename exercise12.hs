{- CSCI-2322
 - A Few More Recursions

 - Copy this file to your home directory, and complete it when called for in the class.
 -}

-- 1. Finish defining insertionSort by defining the insert helper function.
-- insert takes an element and an already-sorted lists, and inserts the element into the list.
insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where insert :: Ord a => a -> [a] -> [a]
        insert x lst = undefined

-- 2. Define the function dropEveryNth that takes a list and drops every nth element. 
-- For instance, removing every second element from [1,2,3,4,5] results in [1,3,5]. 
dropEveryNth :: Int -> [a] -> [a]
dropEveryNth n lst = undefined

-- 3. The nth Fibonacci number is the sum of the (n-1)th and (n-2)th Fibonacci numbers, 
-- as described in the following function. However, this function is very, very, very slow.
-- Figure out a way to compute Fibonaccis number in linear, instead of exponential, time.

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
-- fib 31 is noticably slow, and it gets worse from there! A quick fibonacci implementation should
-- be able to compute fib 10000 instantaneously.

quickFib :: Integer -> Integer
quickFib n = undefined
  where aux = undefined

-- quickFib 10000
-- 33644764876431783266621612005107543310302148460680063906564769974680081442166662368155595513633734025582065332680836159373734790483865268263040892463056431887354544369559827491606602099884183933864652731300088830269235673613135117579297437854413752130520504347701602264758318906527890855154366159582987279682987510631200575428783453215515103870818298969791613127856265033195487140214287532698187962046936097879900350962302291026368131493195275630227837628441540360584402572114334961180023091208287046088923962328835461505776583271252546093591128203925285393434620904245248929403901706233888991085841065183173360437470737908552631764325733993712871937587746897479926305837065742830161637408969178426378624212835258112820516370298089332099905707920064367426202389783111470054074998459250360633560933883831923386783056136435351892133279732908133732642652633989763922723407882928177953580570993691049175470808931841056146322338217465637321248226383092103297701648054726243842374862411453093812206564914032751086643394517512161526545361333111314042436854805106765843493523836959653428071768775328348234345557366719731392746273629108210679280784718035329131176778924659089938635459327894523777674406192240337638674004021330343297496902028328145933418826817683893072003634795623117103101291953169794607632737589253530772552375943788434504067715555779056450443016640119462580972216729758615026968443146952034614932291105970676243268515992834709891284706740862008587135016260312071903172086094081298321581077282076353186624611278245537208532365305775956430072517744315051539600905168603220349163222640885248852433158051534849622434848299380905070483482449327453732624567755879089187190803662058009594743150052402532709746995318770724376825907419939632265984147498193609285223945039707165443156421328157688908058783183404917434556270520223564846495196112460268313970975069382648706613264507665074611512677522748621598642530711298441182622661057163515069260029861704945425047491378115154139941550671256271197133252763631939606902895650288268608362241082050562430701794976171121233066073310059947366875 
