/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.AnimMapper
{
  // MARK: - Initializers

  /// Construct an identity mapper for remapping a range of elements.
  /// An identity mapper indicates that no remapping is required.
  /// - Parameter size: The number of elements.
  init(size: Int)
  {
    self.init(size)
  }

  /// Construct a mapper for mapping data from source order to target order.
  /// - Parameters:
  ///   - sourceOrder: The source joint/blend shape ordering.
  ///   - targetOrder: The target joint/blend shape ordering.
  init(sourceOrder: VtTokenArray, targetOrder: VtTokenArray)
  {
    self.init(sourceOrder, targetOrder)
  }

  // MARK: - Mapping State

  /// Returns true if this is an identity map.
  /// The source and target orders of an identity map are identical.
  var isIdentity: Bool
  {
    IsIdentity()
  }

  /// Returns true if this is a sparse mapping.
  /// A sparse mapping means that not all target values will be overridden
  /// by source values when mapped with remap().
  var isSparse: Bool
  {
    IsSparse()
  }

  /// Returns true if this is a null mapping.
  /// No source elements of a null map are mapped to the target.
  var isNull: Bool
  {
    IsNull()
  }

  /// Get the size of the output array that this mapper expects to map data into.
  var count: Int
  {
    Int(size())
  }

  // MARK: - Type-Erased Remapping

  /// Type-erased remapping of data from source into target.
  /// The source array provides a run of elementSize elements for each
  /// path in the source order. These elements are remapped and copied
  /// over the target array.
  /// - Parameters:
  ///   - source: The source value to remap.
  ///   - target: The target value to write to.
  ///   - elementSize: Number of elements per entry (default 1).
  ///   - defaultValue: Default value for unmapped elements.
  /// - Returns: true if remapping succeeded.
  @discardableResult
  func remap(_ source: Vt.Value,
             _ target: inout Vt.Value,
             elementSize: Int32 = 1,
             defaultValue: Vt.Value = Vt.Value()) -> Bool
  {
    Remap(source, &target, elementSize, defaultValue)
  }
}
