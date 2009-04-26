Rem
	bbdoc:
	about:
End Rem
Type TFzVery Extends TFuzzyTerm
	Field m_Set:TFuzzySet
	
	Rem
		bbdoc:
	End Rem
	Method Create:TFzVery(ft:TFzVery)
		Self.m_set = ft.m_Set
		Return Self
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method GetDOM:Double()
		Return Self.m_Set.GetDOM() * Self.m_Set.GetDOM()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		Return Self
		Return New TFzVery.Create(Self)
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ClearDOM()
		Self.m_Set.ClearDOM()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ORwithDOM(val:Double)
		Self.m_Set.ORwithDOM(val * val)
	End Method
End Type

Rem
	bbdoc:
	about:
End Rem
Type TFzFairly Extends TFuzzyTerm
	Field m_Set:TFuzzySet
	
	Rem
		bbdoc:
	End Rem
	Method Create:TFzFairly(ft:TFzFairly)
		Self.m_set = ft.m_Set
		Return Self
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method GetDOM:Double()
		Return Sqr(Self.m_Set.GetDOM())
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method Clone:TFuzzyTerm()
		Return Self
		Return New TFzFairly.Create(Self)
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ClearDOM()
		Self.m_Set.ClearDOM()
	End Method
	
	Rem
		bbdoc:
	End Rem
	Method ORwithDOM(val:Double)
		Self.m_Set.ORwithDOM(Sqr(val))
	End Method
End Type
