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
