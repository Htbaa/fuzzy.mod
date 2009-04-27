Rem
	bbdoc: Fuzzy Term
	about:
	abstract class to provide an interface for classes able to be used as terms in a fuzzy if-then rule base.
End Rem
Type TFuzzyTerm Abstract
	Rem
		bbdoc: all terms must implement a virtual constructor
	End Rem
	Method Clone:TFuzzyTerm() Abstract
	Rem
		bbdoc: retrieves the degree of membership of the term
	End Rem
	Method GetDOM:Double() Abstract
	
	Rem
		bbdoc: clears the degree of membership of the term
	End Rem
	Method ClearDOM() Abstract
	
	Rem
		bbdoc: method for updating the DOM of a consequent when a rule fires
	End Rem
	Method ORwithDOM(val:Double) Abstract
End Type
