/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import UsdSkel

// MARK: - Top-Level Type Aliases

/// Type alias for C++ UsdSkelAnimation class.
public typealias UsdSkelAnimation = Pixar.UsdSkelAnimation

/// Type alias for C++ UsdSkelSkeleton class.
public typealias UsdSkelSkeleton = Pixar.UsdSkelSkeleton

/// Type alias for C++ UsdSkelBindingAPI class.
public typealias UsdSkelBindingAPI = Pixar.UsdSkelBindingAPI

/// Type alias for C++ UsdSkelRoot class.
public typealias UsdSkelRoot = Pixar.UsdSkelRoot

/// Type alias for C++ UsdSkelAnimQuery class.
public typealias UsdSkelAnimQuery = Pixar.UsdSkelAnimQuery

/// Type alias for C++ UsdSkelCache class.
public typealias UsdSkelCache = Pixar.UsdSkelCache

/// Type alias for C++ UsdSkelTopology class.
public typealias UsdSkelTopology = Pixar.UsdSkelTopology

/// Type alias for C++ UsdSkelSkeletonQuery class.
public typealias UsdSkelSkeletonQuery = Pixar.UsdSkelSkeletonQuery

/// Type alias for C++ UsdSkelSkinningQuery class.
public typealias UsdSkelSkinningQuery = Pixar.UsdSkelSkinningQuery

/// Type alias for C++ UsdSkelBlendShape class.
public typealias UsdSkelBlendShape = Pixar.UsdSkelBlendShape

/// Type alias for C++ UsdSkelInbetweenShape class.
public typealias UsdSkelInbetweenShape = Pixar.UsdSkelInbetweenShape

/// Type alias for C++ UsdSkelBinding class.
public typealias UsdSkelBinding = Pixar.UsdSkelBinding

/// Type alias for C++ UsdSkelBlendShapeQuery class.
public typealias UsdSkelBlendShapeQuery = Pixar.UsdSkelBlendShapeQuery

/// Type alias for C++ UsdSkelAnimMapper class.
public typealias UsdSkelAnimMapper = Pixar.UsdSkelAnimMapper

/// Type alias for C++ UsdSkelAnimMapperRefPtr (shared_ptr).
public typealias UsdSkelAnimMapperRefPtr = Pixar.UsdSkelAnimMapperRefPtr

// MARK: - UsdSkel Namespace

/**
 * # ``UsdSkel``
 *
 * **USD Skeleton Schema**
 *
 * ## Overview
 *
 * **UsdSkel** provides schemas for skeletal animation in USD, supporting:
 * - Skeleton definition and topology
 * - Joint animation data (transforms, blend shapes)
 * - Skeleton-to-mesh binding
 * - Skinning evaluation
 *
 * ## Core Types
 *
 * - ``Animation`` - Stores joint animation data
 * - ``Skeleton`` - Defines skeleton topology and poses
 * - ``Root`` - Marks skeleton subtree root
 * - ``BindingAPI`` - Links skeleton to skinnable prims
 * - ``BlendShape`` - Defines blend shape targets
 *
 * ## Query Types
 *
 * - ``AnimQuery`` - Evaluates animation at time codes
 * - ``SkeletonQuery`` - Queries bound skeleton data
 * - ``SkinningQuery`` - Queries skinning bindings
 * - ``Cache`` - Thread-safe cache for queries
 *
 * ## Usage
 *
 * ```swift
 * // Create skeleton hierarchy
 * let skelRoot = UsdSkel.Root.define(stage, path: "/Character")
 * let skeleton = UsdSkel.Skeleton.define(stage, path: "/Character/Skel")
 * let animation = UsdSkel.Animation.define(stage, path: "/Character/Anim")
 *
 * // Bind skeleton to mesh
 * let bindingAPI = UsdSkel.BindingAPI.apply(meshPrim)
 * bindingAPI.createSkeletonRel().addTarget("/Character/Skel")
 * bindingAPI.createAnimationSourceRel().addTarget("/Character/Anim")
 * ```
 */
public enum UsdSkel
{
  // Nested typealiases for namespace-qualified access
  public typealias Animation = UsdSkelAnimation
  public typealias Skeleton = UsdSkelSkeleton
  public typealias BindingAPI = UsdSkelBindingAPI
  public typealias Root = UsdSkelRoot
  public typealias AnimQuery = UsdSkelAnimQuery
  public typealias Cache = UsdSkelCache
  public typealias Topology = UsdSkelTopology
  public typealias SkeletonQuery = UsdSkelSkeletonQuery
  public typealias SkinningQuery = UsdSkelSkinningQuery
  public typealias BlendShape = UsdSkelBlendShape
  public typealias InbetweenShape = UsdSkelInbetweenShape
  public typealias Binding = UsdSkelBinding
  public typealias BlendShapeQuery = UsdSkelBlendShapeQuery
  public typealias AnimMapper = UsdSkelAnimMapper
  public typealias AnimMapperRefPtr = UsdSkelAnimMapperRefPtr
}
