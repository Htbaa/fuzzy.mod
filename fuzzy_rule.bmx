Rem
	Copyright (c) 2010 Christiaan Kras
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
End Rem

Rem
	bbdoc: Fuzzy Rule type
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
		bbdoc: Create a fuzzy rule
		about: Both ant and con are cloned
	End Rem
	Method Create:TFuzzyRule(ant:TFuzzyTerm, con:TFuzzyTerm)
		Self.m_pAntecedent = ant.Clone()
		Self.m_pConsequence = con.Clone()
		Return Self
	End Method
	
	Rem
		bbdoc: Calls ClearDOM on the consqequence term
	End Rem
	Method SetConfidenceOfConsequentToZero()
		Self.m_pConsequence.ClearDOM()
	End Method
	
	Rem
		bbdoc: this method updates the DOM (the confidence) of the consequent term with the DOM of the antecedent term. 
	End Rem
	Method Calculate()
		Self.m_pConsequence.ORwithDOM(Self.m_pAntecedent.GetDOM())
	End Method
End Type
