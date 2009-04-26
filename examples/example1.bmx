SuperStrict

Import htbaapub.fuzzy

Local fm:TFuzzyModule = New TFuzzyModule

Local distToTarget:TFuzzyVariable = fm.CreateFLV("DistToTarget")
Local TargetClose:TFzSet = distToTarget.AddLeftShoulderSet("TargetClose", 0, 25, 150)
Local TargetMedium:TFzSet = distToTarget.AddTriangularSet("TargetMedium", 25, 50, 300)
Local TargetFar:TFzSet = distToTarget.AddRightShoulderSet("TargetFar", 150, 300, 1000)

Local desirability:TFuzzyVariable = fm.CreateFLV("Desirability")
Local VeryDesirable:TFzSet = desirability.AddRightShoulderSet("VeryDesirable", 50, 75, 100)
Local Desirable:TFzSet = desirability.AddTriangularSet("Desirable", 25, 50, 75)
Local Undesirable:TFzSet = desirability.AddLeftShoulderSet("Undesirable", 0, 25, 50)

Local ammoStatus:TFuzzyVariable = fm.CreateFLV("AmmoStatus")
Local AmmoLoads:TFzSet = ammoStatus.AddRightShoulderSet("AmmoLoads", 10, 30, 100)
Local AmmoOkay:TFzSet = ammoStatus.AddTriangularSet("AmmoOkay", 0, 10, 30)
Local AmmowLow:TFzSet = ammoStatus.AddTriangularSet("AmmoLow", 0, 0, 10)


fm.AddRule(FzAND([TargetClose, AmmoLoads]), Undesirable)
fm.AddRule(FzAND([TargetClose, AmmoOkay]), Undesirable)
fm.AddRule(FzAND([TargetClose, AmmowLow]), Undesirable)

fm.AddRule(FzAND([TargetMedium, AmmoLoads]), VeryDesirable)
fm.AddRule(FzAND([TargetMedium, AmmoOkay]), VeryDesirable)
fm.AddRule(FzAND([TargetMedium, AmmowLow]), Desirable)

fm.AddRule(FzAND([TargetFar, AmmoLoads]), Desirable)
fm.AddRule(FzAND([TargetFar, AmmoOkay]), Undesirable)
fm.AddRule(FzAND([TargetFar, AmmowLow]), Undesirable)

fm.Fuzzify("DistToTarget", 40)
fm.Fuzzify("AmmoStatus", 10)

'fuzzify distance and amount of ammo
Local result1:Double = fm.Defuzzify("Desirability", TFuzzyModule.DefuzzifyMethod_MaxAv)
Local result2:Double = fm.Defuzzify("Desirability", TFuzzyModule.DefuzzifyMethod_Centroid)
DebugLog result1
DebugLog result2
