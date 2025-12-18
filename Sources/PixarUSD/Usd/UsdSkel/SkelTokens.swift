/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

@preconcurrency import UsdSkel

private extension UsdSkel
{
  /**
   * Private struct to hold the static
   * data for the UsdSkel library. */
  struct StaticData: @unchecked Sendable
  {
    static let shared = StaticData()
    private init()
    {}

    let tokens = Pixar.UsdSkelTokensType()
  }
}

public extension UsdSkel
{
  /**
   * # UsdSkel.Tokens
   *
   * ## Overview
   *
   * Public, client facing API to access
   * the static UsdSkel tokens.
   *
   * ## Usage
   *
   * ```swift
   * let method = UsdSkel.Tokens.classicLinear.getToken()
   * let dq = UsdSkel.Tokens.dualQuaternion.getToken()
   * ```
   */
  enum Tokens: CaseIterable
  {
    // Attribute tokens
    case bindTransforms
    case blendShapes
    case blendShapeWeights
    case jointNames
    case joints
    case normalOffsets
    case offsets
    case pointIndices
    case restTransforms
    case rotations
    case scales
    case translations
    case weight

    // Skinning method tokens
    case classicLinear
    case dualQuaternion

    // Primvar tokens
    case primvarsSkelGeomBindTransform
    case primvarsSkelJointIndices
    case primvarsSkelJointWeights
    case primvarsSkelSkinningMethod

    // Relationship tokens
    case skelAnimationSource
    case skelBlendShapes
    case skelBlendShapeTargets
    case skelJoints
    case skelSkeleton

    // Schema identifier tokens
    case blendShape
    case skelAnimation
    case skelBindingAPI
    case skeleton
    case skelRoot

    public func getToken() -> Tf.Token
    {
      switch self
      {
        case .bindTransforms: StaticData.shared.tokens.bindTransforms
        case .blendShapes: StaticData.shared.tokens.blendShapes
        case .blendShapeWeights: StaticData.shared.tokens.blendShapeWeights
        case .jointNames: StaticData.shared.tokens.jointNames
        case .joints: StaticData.shared.tokens.joints
        case .normalOffsets: StaticData.shared.tokens.normalOffsets
        case .offsets: StaticData.shared.tokens.offsets
        case .pointIndices: StaticData.shared.tokens.pointIndices
        case .restTransforms: StaticData.shared.tokens.restTransforms
        case .rotations: StaticData.shared.tokens.rotations
        case .scales: StaticData.shared.tokens.scales
        case .translations: StaticData.shared.tokens.translations
        case .weight: StaticData.shared.tokens.weight
        case .classicLinear: StaticData.shared.tokens.classicLinear
        case .dualQuaternion: StaticData.shared.tokens.dualQuaternion
        case .primvarsSkelGeomBindTransform: StaticData.shared.tokens.primvarsSkelGeomBindTransform
        case .primvarsSkelJointIndices: StaticData.shared.tokens.primvarsSkelJointIndices
        case .primvarsSkelJointWeights: StaticData.shared.tokens.primvarsSkelJointWeights
        case .primvarsSkelSkinningMethod: StaticData.shared.tokens.primvarsSkelSkinningMethod
        case .skelAnimationSource: StaticData.shared.tokens.skelAnimationSource
        case .skelBlendShapes: StaticData.shared.tokens.skelBlendShapes
        case .skelBlendShapeTargets: StaticData.shared.tokens.skelBlendShapeTargets
        case .skelJoints: StaticData.shared.tokens.skelJoints
        case .skelSkeleton: StaticData.shared.tokens.skelSkeleton
        case .blendShape: StaticData.shared.tokens.BlendShape
        case .skelAnimation: StaticData.shared.tokens.SkelAnimation
        case .skelBindingAPI: StaticData.shared.tokens.SkelBindingAPI
        case .skeleton: StaticData.shared.tokens.Skeleton
        case .skelRoot: StaticData.shared.tokens.SkelRoot
      }
    }
  }

  /// Swift enum for skinning methods
  enum SkinningMethod: String, CaseIterable
  {
    case classicLinear
    case dualQuaternion

    public var token: Tf.Token
    {
      switch self
      {
        case .classicLinear: Tokens.classicLinear.getToken()
        case .dualQuaternion: Tokens.dualQuaternion.getToken()
      }
    }
  }
}
