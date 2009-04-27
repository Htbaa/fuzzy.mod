Rem
	bbdoc: Class to define a fuzzy linguistic variable (FLV).
	about: An FLV comprises of a number of fuzzy sets
End Rem
Type TFuzzyVariable
	Field m_MemberSets:TMap
	'the minimum and maximum value of the range of this variable
	Field m_dMinRange:Double
	Field m_dMaxRange:Double
	
	Rem
		bbdoc: Initializes fuzzy variable
	End Rem
	Method New()
		Self.m_dMinRange = 0.0
		Self.m_dMaxRange = 0.0
		Self.m_MemberSets = New TMap
	End Method
	
	Rem
		bbdoc: this method is called with the upper and lower bound of a set each time a new set is added to adjust the upper and lower range values accordingly
	End Rem
	Method AdjustRangeToFit(minBound:Double, maxBound:Double)
		If minBound < Self.m_dMinRange Then Self.m_dMinRange = minBound
		If maxBound > Self.m_dMaxRange Then Self.m_dMaxRange = maxBound
	End Method
	
	'the following methods create instances of the sets named in the method
	'name and add them to the member set map. Each time a set of any type is
	'added the m_dMinRange and m_dMaxRange are adjusted accordingly. All of the
	'methods return a proxy class representing the newly created instance. This
	'proxy set can be used as an operand when creating the rule base.

	Rem
		bbdoc: adds a left shoulder type set
	End Rem
	Method AddLeftShoulderSet:TFzSet(name:String, minBound:Double, peak:Double, maxBound:Double)
		Local set:TFuzzySetLeftShoulder = New TFuzzySetLeftShoulder.Create(peak, peak - minBound, maxBound - peak)
		Self.m_MemberSets.Insert(name, set)
		
		Self.AdjustRangeToFit(minBound, maxBound)

		Return New TFzSet.Create(set)
	End Method

	Rem
		bbdoc: adds a right shoulder type set
	End Rem
	Method AddRightShoulderSet:TFzSet(name:String, minBound:Double, peak:Double, maxBound:Double)
		Local set:TFuzzySetRightShoulder = New TFuzzySetRightShoulder.Create(peak, peak - minBound, maxBound - peak)
		Self.m_MemberSets.Insert(name, set)
		
		Self.AdjustRangeToFit(minBound, maxBound)

		Return New TFzSet.Create(set)
	End Method

	Rem
		bbdoc: adds a triangular shaped fuzzy set to the variable
	End Rem
	Method AddTriangularSet:TFzSet(name:String, minBound:Double, peak:Double, maxBound:Double)
		Local set:TFuzzySetTriangle = New TFuzzySetTriangle.Create(peak, peak - minBound, maxBound - peak)
		Self.m_MemberSets.Insert(name, set)
		
		Self.AdjustRangeToFit(minBound, maxBound)

		Return New TFzSet.Create(set)
	End Method
	
	Rem
		bbdoc: adds a singleton to the variable
	End Rem
	Method AddSingletonSet:TFzSet(name:String, minBound:Double, peak:Double, maxBound:Double)
		Local set:TFuzzySetSingleton = New TFuzzySetSingleton.Create(peak, peak - minBound, maxBound - peak)
		Self.m_MemberSets.Insert(name, set)
		
		Self.AdjustRangeToFit(minBound, maxBound)

		Return New TFzSet.Create(set)
	End Method
	
	Rem
		bbdoc: takes a crisp value and calculates its degree of membership for each set in the variable
	End Rem
	Method Fuzzify(val:Double)
		Assert (val >= Self.m_dMinRange And val <= Self.m_dMaxRange), "TFuzzyVariable.Fuzzify: value out of range"
		'for each set in the flv calculate the DOM for the given value
		For Local curSet:TFuzzySet = EachIn Self.m_MemberSets.Values()
			curSet.SetDOM(curset.CalculateDOM(val))
		Next
	End Method

	Rem
		bbdoc: defuzzifies the value by averaging the maxima of the sets that have fired
		about: OUTPUT = sum (maxima * DOM) / sum (DOMs) 
	End Rem
	Method DeFuzzifyMaxAv:Double()
		Local bottom:Double = 0.0
		Local top:Double = 0.0

		For Local curSet:TFuzzySet = EachIn Self.m_MemberSets.Values()
			bottom:+curSet.GetDOM()
			top:+curSet.GetRepresentativeVal() * curSet.GetDOM()
		Next
		
		If bottom = 0
			Return 0.0
		End If
		
		Return top / bottom;
	End Method
	
	Rem
		bbdoc: defuzzify the variable using the centroid method
	End Rem
	Method DeFuzzifyCentroid:Double(numSamples:Int)
		'calculate the step size
		Local stepSize:Double = (Self.m_dMaxRange - Self.m_dMinRange) / Double(numSamples)
		
		Local totalArea:Double = 0.0
		Local sumOfMoments:Double = 0.0
		
		'step through the range of this variable in increments equal to StepSize
		'adding up the contribution (lower of CalculateDOM or the actual DOM of this
		'variable's fuzzified value) for each subset. This gives an approximation of
		'the total area of the fuzzy manifold.(This is similar to how the area under
		'a curve is calculated using calculus... the heights of lots of 'slices' are
		'summed to give the total area.)
		
		'in addition the moment of each slice is calculated and summed. Dividing
		'the total area by the sum of the moments gives the centroid. (Just like
		'calculating the center of mass of an object)
		For Local samp:Int = 1 To numSamples
		    'for each set get the contribution to the area. This is the lower of the 
		    'value returned from CalculateDOM or the actual DOM of the fuzzified 
		    'value itself
			For Local curSet:TFuzzySet = EachIn Self.m_MemberSets.Values()
				Local contribution:Double = Min(curSet.CalculateDOM(Self.m_dMinRange + samp * stepSize), curSet.GetDOM())
				totalArea:+contribution
				sumOfMoments:+(Self.m_dMinRange + samp * stepSize) * contribution
			Next
		Next
		
		If totalArea = 0
			Return 0.0
		End If
		
		Return sumOfMoments / totalArea
	End Method
	
	Rem
		bbdoc: Used for debugging
	End Rem
	Method WriteDOMs:String(stream:String Var)
		For Local key:String = EachIn Self.m_MemberSets.Keys()
			stream:+"~n" + key + " is " + TFuzzySet(Self.m_MemberSets.ValueForKey(key)).GetDOM()
		Next
		
		stream:+"~nMin Range: " + Self.m_dMinRange + "~nMax Range: " + Self.m_dMaxRange
		
		Return stream
	End Method
End Type
