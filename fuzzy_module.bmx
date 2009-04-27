Rem
	bbdoc: The hearth of our fuzzy system
	about: Used to add FLV's, Fuzzify and DeFuzzify values
End Rem
Type TFuzzyModule
	Rem
		bbdoc: MaxAV Defuzzify method
		about: Pass this value to the defuzzify method
	End Rem
	Const DefuzzifyMethod_MaxAv:Int = 0
	
	Rem
		bbdoc: Centroid defuzzify method
		about: Pass this value to the defuzzify method
	End Rem
	Const DefuzzifyMethod_Centroid:Int = 1

	'when calculating the centroid of the fuzzy manifold this value is used
  	'to determine how many cross-sections should be sampled
	Const NumSamples:Int = 15
	
	'a map of all the fuzzy variables this module uses
	Field m_Variables:TMap
	'a vector containing all the fuzzy rules
	Field m_Rules:TList
	
	Rem
		bbdoc: Constructor
	End Rem
	Method New()
		Self.m_Variables = New TMap
		Self.m_Rules = New TList
	End Method
	
	Rem
		bbdoc: zeros the DOMs of the consequents of each rule. Used by Defuzzify()
	End rem
	Method SetConfidencesOfConsequentsToZero()
		For Local curRule:TFuzzyRule = EachIn Self.m_Rules
			curRule.SetConfidenceOfConsequentToZero()
		Next
	End Method
	
	Rem
		bbdoc: creates a new 'empty' fuzzy variable and returns a reference to it.
	End Rem
	Method CreateFLV:TFuzzyVariable(varName:String)
		Self.m_Variables.Insert(varName, New TFuzzyVariable)
		Return TFuzzyVariable(Self.m_Variables.ValueForKey(varName))
	End Method
	
	Rem
		bbdoc: adds a rule to the module
	End Rem
	Method AddRule(antecedent:TFuzzyTerm, consequence:TFuzzyTerm)
		Self.m_Rules.AddLast(New TFuzzyRule.Create(antecedent, consequence))
	End Method
	
	Rem
		bbdoc: this method calls the Fuzzify method of the named FLV 
	End Rem
	Method Fuzzify(nameOfFLV:String, val:Double)
		Assert Self.m_Variables.ValueForKey(nameOfFLV), "TFuzzyModule.Fuzzify: key not found"
		TFuzzyVariable(Self.m_Variables.ValueForKey(nameOfFLV)).Fuzzify(val)
	End Method
	
	Rem
		bbdoc: given a fuzzy variable and a deffuzification method this returns a crisp value
	End Rem
	Method Defuzzify:Double(key:String, defuzzifyMethod:Int = TFuzzyModule.DefuzzifyMethod_MaxAv)
		Assert Self.m_Variables.ValueForKey(key), "TFuzzyModule.Defuzzify: key not found"
		'clear the DOMs of all the consequents of all the rules
		Self.SetConfidencesOfConsequentsToZero()
		'process the rules
		For Local curRule:TFuzzyRule = EachIn Self.m_Rules
			curRule.Calculate()
		Next
		
		'now defuzzify the resultant conclusion using the specified method
		Select defuzzifyMethod
			Case TFuzzyModule.DefuzzifyMethod_Centroid
				Return TFuzzyVariable(Self.m_Variables.ValueForKey(key)).DeFuzzifyCentroid(TFuzzyModule.NumSamples)
			Case TFuzzyModule.DefuzzifyMethod_MaxAv
				Return TFuzzyVariable(Self.m_Variables.ValueForKey(key)).DeFuzzifyMaxAv()
			Default
				Throw "Unkown defuzzify method"
		End Select
	End Method
	
	Rem
		bbdoc: writes the DOMs of all the variables in the module to an output stream
		about: Used for debugging
	End Rem
	Method WriteAllDOMs:String(stream:String Var)
		stream:+"~n~n"
		
		For Local key:String = EachIn Self.m_Variables.Keys()
			stream:+"~n--------------------------- " + key
			TFuzzyVariable(Self.m_Variables.ValueForKey(key)).WriteDOMs(stream)
			stream:+"~n"
		Next

		Return stream
	End Method
End Type
