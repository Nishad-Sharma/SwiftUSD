/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.Binding
{
  // MARK: - Skeleton Access

  /// Returns the bound skeleton.
  func getSkeleton() -> UsdSkel.Skeleton
  {
    Pixar.UsdSkel_Swift_BindingGetSkeleton(self)
  }

  // MARK: - Skinning Targets

  /// Returns the number of skinning targets.
  var skinningTargetCount: Int
  {
    Int(Pixar.UsdSkel_Swift_BindingGetSkinningTargetCount(self))
  }

  /// Returns the skinning query at the given index.
  /// - Parameter index: The index of the skinning target.
  /// - Returns: The skinning query at the specified index.
  func getSkinningTarget(at index: Int) -> UsdSkel.SkinningQuery
  {
    Pixar.UsdSkel_Swift_BindingGetSkinningTargetAtIndex(self, index)
  }
}
