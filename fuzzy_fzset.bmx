Rem
	bbdoc: class to provide a proxy for a fuzzy set. The proxy inherits from FuzzyTerm and therefore can be used to create fuzzy rules
End Rem
Type TFzSet Extends TFuzzyTerm
	'a reference to the fuzzy set this proxy represents
	Field m_Set:TFuzzySet

	Rem
		bbdoc: Create a TFzSet
	End Rem
	Method Create:TFzSet(fs:TFuzzySet)
		Self.m_Set = fs
		Return Self
	End Method
	
	Rem
		bbdoc: Clone a TFzSet
	End Rem
	Method Clone:TFuzzyTerm()
		Return New TFzSet.Create(Self.m_Set)
	End Method
	
	Rem
		bbdoc: Returns DOM
	End Rem
	Method GetDOM:Double()
		Return Self.m_Set.GetDom()
	End Method

	Rem
		bbdoc: Clears DOM
	End Rem
	Method ClearDOM()
		Self.m_Set.ClearDOM()
	End Method

	Rem
		bbdoc:
	End Rem
	Method ORwithDOM(val:Double)
		Self.m_Set.OrWithDOM(val)
	End Method
End Type
