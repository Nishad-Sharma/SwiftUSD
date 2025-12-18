/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import Usd
import UsdSkel

public extension UsdSkel.Cache
{
  // MARK: - Cache Management

  /// Clear all cached data.
  mutating func clear()
  {
    Clear()
  }

  /// Populate the cache for skeletal data beneath the given root.
  /// - Parameters:
  ///   - root: The SkelRoot to populate from.
  ///   - predicate: Traversal predicate for prim filtering.
  /// - Returns: true if population succeeded.
  @discardableResult
  func populate(_ root: UsdSkel.Root, predicate: Pixar.Usd_PrimFlagsPredicate) -> Bool
  {
    Populate(root, predicate)
  }

  // MARK: - Query Access

  /// Get a skeleton query for computing properties of a skeleton.
  /// - Note: Does not require `populate()` to be called first.
  func getSkelQuery(_ skel: UsdSkel.Skeleton) -> UsdSkel.SkeletonQuery
  {
    GetSkelQuery(skel)
  }

  /// Get an animation query for the given animation.
  /// - Note: Does not require `populate()` to be called first.
  func getAnimQuery(_ anim: UsdSkel.Animation) -> UsdSkel.AnimQuery
  {
    GetAnimQuery(anim)
  }

  /// Get an animation query for the given prim.
  /// - Note: Does not require `populate()` to be called first.
  func getAnimQuery(_ prim: Usd.Prim) -> UsdSkel.AnimQuery
  {
    GetAnimQuery(prim)
  }

  /// Get a skinning query for the given prim.
  /// - Note: Requires `populate()` to be called first with the containing SkelRoot.
  func getSkinningQuery(_ prim: Usd.Prim) -> UsdSkel.SkinningQuery
  {
    GetSkinningQuery(prim)
  }
}
