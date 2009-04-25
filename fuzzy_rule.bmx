Rem
	bbdoc:
	about:
	This class implements a fuzzy rule of the form:
	IF fzVar1 AND fzVar2 AND ... fzVarn THEN fzVar.c
End Rem
Type TFuzzyRule
	'antecedent (usually a composite of several fuzzy sets and operators)
	Field m_pAntecedent:TFuzzyTerm
	'consequence (usually a single fuzzy set, but can be several ANDed together)
	Field m_pConsequence:TFuzzyTerm
	
	Rem
		bbdoc:
		about:
	End Rem
	Method Create:TFuzzyRule(ant:TFuzzyTerm, con:TFuzzyTerm)
		Self.m_pAntecedent = ant.Clone()
		Self.m_pConsequence = con.Clone()
		Return Self
	End Method
	
	Rem
		bbdoc:
		about:
	End Rem
	Method SetConfidenceOfConsequentToZero()
		Self.m_pConsequence.ClearDOM()
	End Method
	
	Rem
		bbdoc: this method updates the DOM (the confidence) of the consequent term with the DOM of the antecedent term. 
		about:
	End Rem
	Method Calculate()
		Self.m_pConsequence.ORwithDOM(Self.m_pAntecedent.GetDOM())
	End Method
End Type
