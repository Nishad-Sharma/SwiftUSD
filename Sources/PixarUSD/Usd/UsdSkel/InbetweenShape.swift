/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2018 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.InbetweenShape
{
  // Note: Use the C++ constructor UsdSkelInbetweenShape(attr) to create an inbetween shape
  // from a UsdAttribute. Swift convenience initializers cannot be added due to C++ interop
  // limitations with the designated initializer pattern.

  // MARK: - Weight

  /// Get the weight location at which the shape is applied.
  /// - Returns: The weight value, or nil if not authored.
  func getWeight() -> Float?
  {
    var weight: Float = 0
    return GetWeight(&weight) ? weight : nil
  }

  /// Set the weight location at which the shape is applied.
  /// - Parameter weight: The weight value.
  /// - Returns: true if setting succeeded.
  @discardableResult
  func setWeight(_ weight: Float) -> Bool
  {
    SetWeight(weight)
  }

  /// Returns true if a weight value has been explicitly authored on this shape.
  var hasAuthoredWeight: Bool
  {
    HasAuthoredWeight()
  }

  // MARK: - Point Offsets

  /// Get the point offsets corresponding to this shape.
  /// - Parameter offsets: Output array for point offsets.
  /// - Returns: true if offsets were retrieved successfully.
  @discardableResult
  func getOffsets(_ offsets: inout VtVec3fArray) -> Bool
  {
    GetOffsets(&offsets)
  }

  /// Set the point offsets corresponding to this shape.
  /// - Parameter offsets: The point offsets to set.
  /// - Returns: true if offsets were set successfully.
  @discardableResult
  func setOffsets(_ offsets: VtVec3fArray) -> Bool
  {
    SetOffsets(offsets)
  }

  // MARK: - Normal Offsets

  /// Get the normal offsets attribute if the shape has normal offsets.
  /// - Returns: A valid attribute if normal offsets exist, invalid otherwise.
  func getNormalOffsetsAttr() -> Usd.Attribute
  {
    GetNormalOffsetsAttr()
  }

  /// Create or get the normal offsets attribute.
  /// - Parameter defaultValue: Optional default value for the attribute.
  /// - Returns: The created or existing normal offsets attribute.
  @discardableResult
  func createNormalOffsetsAttr(_ defaultValue: Vt.Value = Vt.Value()) -> Usd.Attribute
  {
    CreateNormalOffsetsAttr(defaultValue)
  }

  /// Get the normal offsets authored for this shape.
  /// Normal offsets are optional and may be left unspecified.
  /// - Parameter offsets: Output array for normal offsets.
  /// - Returns: true if offsets were retrieved successfully.
  @discardableResult
  func getNormalOffsets(_ offsets: inout VtVec3fArray) -> Bool
  {
    GetNormalOffsets(&offsets)
  }

  /// Set the normal offsets for this shape.
  /// - Parameter offsets: The normal offsets to set.
  /// - Returns: true if offsets were set successfully.
  @discardableResult
  func setNormalOffsets(_ offsets: VtVec3fArray) -> Bool
  {
    SetNormalOffsets(offsets)
  }

  // MARK: - Static Methods

  /// Test whether a given attribute represents a valid inbetween shape.
  /// - Parameter attr: The attribute to test.
  /// - Returns: true if the attribute represents an inbetween shape.
  static func isInbetween(_ attr: Usd.Attribute) -> Bool
  {
    IsInbetween(attr)
  }
}
