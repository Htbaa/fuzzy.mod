Rem
	bbdoc:
	about:
End Rem
Type TFuzzySetTriangle Extends TFuzzySet
End Type
rem
#ifndef FUZZYSET_TRIANGLE_H
#define FUZZYSET_TRIANGLE_H
//-----------------------------------------------------------------------------
//
//  Name:   FuzzySetTriangle.h
//
//  Author: Mat Buckland (www.ai-junkie.com)
//
//  Desc:   This is a simple class to define fuzzy sets that have a triangular 
//          shape and can be defined by a mid point, a left displacement and a
//          right displacement. 
//-----------------------------------------------------------------------------
#include "fuzzy/FuzzySet.h"
#include "misc/utils.h"



class FuzzySet_Triangle : public FuzzySet
{
private:

  //the values that define the shape of this FLV
  double   m_dPeakPoint;
  double   m_dLeftOffset;
  double   m_dRightOffset;

public:
  
  FuzzySet_Triangle(double mid,
                    double lft,
                    double rgt):FuzzySet(mid), 
                               m_dPeakPoint(mid),
                               m_dLeftOffset(lft),
                               m_dRightOffset(rgt)
  {}

  //this method calculates the degree of membership for a particular value
  double CalculateDOM(double val)const;
};



#endif
#include "FuzzySet_Triangle.h"


double FuzzySet_Triangle::CalculateDOM(double val)const
{
  //test for the case where the triangle's left or right offsets are zero
  //(to prevent divide by zero errors below)
  if ( (isEqual(m_dRightOffset, 0.0) && (isEqual(m_dPeakPoint, val))) ||
       (isEqual(m_dLeftOffset, 0.0) && (isEqual(m_dPeakPoint, val))) )
  {
    return 1.0;
  }

  //find DOM if left of center
  if ( (val <= m_dPeakPoint) && (val >= (m_dPeakPoint - m_dLeftOffset)) )
  {
    double grad = 1.0 / m_dLeftOffset;

    return grad * (val - (m_dPeakPoint - m_dLeftOffset));
  }
  //find DOM if right of center
  else if ( (val > m_dPeakPoint) && (val < (m_dPeakPoint + m_dRightOffset)) )
  {
    double grad = 1.0 / -m_dRightOffset;

    return grad * (val - m_dPeakPoint) + 1.0;
  }
  //out of range of this FLV, return zero
  else
  {
    return 0.0;
  }
}
endrem