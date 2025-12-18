/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2019 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.BlendShapeQuery
{
  // Note: Use the C++ constructor UsdSkelBlendShapeQuery(binding) to create a query from
  // a UsdSkelBindingAPI. Swift convenience initializers cannot be added due to C++ interop
  // limitations with the designated initializer pattern.

  // MARK: - Validity

  /// Return true if this query is valid.
  var isValid: Bool
  {
    Pixar.UsdSkel_Swift_BlendShapeQueryIsValid(self)
  }

  // MARK: - Prim Access

  /// Returns the prim the blend shapes apply to.
  func getPrim() -> Usd.Prim
  {
    Pixar.UsdSkel_Swift_BlendShapeQueryGetPrim(self)
  }

  // MARK: - Counts

  /// Returns the number of blend shapes.
  var numBlendShapes: Int
  {
    Int(Pixar.UsdSkel_Swift_BlendShapeQueryGetNumBlendShapes(self))
  }

  /// Returns the number of sub-shapes.
  var numSubShapes: Int
  {
    Int(Pixar.UsdSkel_Swift_BlendShapeQueryGetNumSubShapes(self))
  }

  // MARK: - Blend Shape Access

  /// Returns the blend shape corresponding to the given index.
  /// - Parameter index: The blend shape index.
  /// - Returns: The blend shape at the specified index.
  func getBlendShape(at index: Int) -> UsdSkel.BlendShape
  {
    GetBlendShape(index)
  }

  /// Returns the inbetween shape corresponding to the given sub-shape index, if any.
  /// - Parameter index: The sub-shape index.
  /// - Returns: The inbetween shape at the specified index.
  func getInbetween(at index: Int) -> UsdSkel.InbetweenShape
  {
    GetInbetween(index)
  }

  /// Returns the blend shape index corresponding to the given sub-shape index.
  /// - Parameter subShapeIndex: The sub-shape index.
  /// - Returns: The corresponding blend shape index.
  func getBlendShapeIndex(subShapeIndex: Int) -> Int
  {
    Int(GetBlendShapeIndex(subShapeIndex))
  }

  // MARK: - Packed Shape Table

  /// Compute a packed shape table combining all sub-shapes.
  /// This is intended to help encode blend shapes in a GPU-friendly form.
  /// - Parameters:
  ///   - offsets: Output array for packed offsets (xyz = offset, w = sub-shape index).
  ///   - ranges: Output array for ranges (start, count) per point.
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computePackedShapeTable(_ offsets: inout VtVec4fArray,
                               _ ranges: inout VtVec2iArray) -> Bool
  {
    ComputePackedShapeTable(&offsets, &ranges)
  }

  // MARK: - Description

  /// Get a description string for debugging.
  func getDescription() -> String
  {
    String(GetDescription())
  }
}
