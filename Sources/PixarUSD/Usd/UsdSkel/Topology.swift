/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.Topology
{
  // MARK: - Validation

  /// Validate the topology.
  /// - Parameter reason: Output parameter for validation failure reason.
  /// - Returns: true if the topology is valid.
  @discardableResult
  func validate(_ reason: inout std.string) -> Bool
  {
    Validate(&reason)
  }

  /// Validate the topology (discards reason).
  /// - Returns: true if the topology is valid.
  func validate() -> Bool
  {
    Validate(nil)
  }

  // MARK: - Topology Information

  /// Get the parent indices array.
  func getParentIndices() -> VtIntArray
  {
    Pixar.UsdSkel_Swift_TopologyGetParentIndices(self)
  }

  /// Get the number of joints in the topology.
  func getNumJoints() -> Int
  {
    Int(Pixar.UsdSkel_Swift_TopologyGetNumJoints(self))
  }

  /// Get the number of joints (alias for getNumJoints).
  var count: Int
  {
    Int(Pixar.UsdSkel_Swift_TopologyGetNumJoints(self))
  }

  // MARK: - Joint Queries

  /// Get the parent index of a joint.
  /// - Parameter index: The joint index.
  /// - Returns: The parent joint index, or -1 if the joint is a root.
  func getParent(_ index: Int) -> Int32
  {
    Int32(Pixar.UsdSkel_Swift_TopologyGetParent(self, index))
  }

  /// Check if a joint is a root (has no parent).
  /// - Parameter index: The joint index.
  /// - Returns: true if the joint is a root.
  func isRoot(_ index: Int) -> Bool
  {
    Pixar.UsdSkel_Swift_TopologyIsRoot(self, index)
  }
}
