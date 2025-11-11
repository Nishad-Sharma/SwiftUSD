/* ----------------------------------------------------------------
 * :: :  M  E  T  A  V  E  R  S  E  :                            ::
 * ----------------------------------------------------------------
 * Licensed under the terms set forth in the LICENSE.txt file, this
 * file is available at https://openusd.org/license.
 *
 *                                        Copyright (C) 2016 Pixar.
 *         Copyright (C) 2024 Wabi Foundation. All Rights Reserved.
 * ----------------------------------------------------------------
 *  . x x x . o o o . x x x . : : : .    o  x  o    . : : : .
 * ---------------------------------------------------------------- */

#if canImport(HgiGL)
  import HgiGL

  public enum HgiGL
  {
    public static func createHgi() -> Pixar.HgiGLPtr
    {
      Pixar.HgiGL.CreateHgi()
    }
  }

  public extension Pixar.HgiGL
  {
    private borrowing func GetPrimaryDeviceCopy() -> Pixar.HgiGLDevice
    {
      GetPrimaryDevice()
    }

    var device: Pixar.HgiGLDevice
    {
      GetPrimaryDeviceCopy()
    }

    func getValue(_ ptr: Pixar.HgiGLPtr) -> VtValue
    {
      GetValue(ptr)
    }
  }

  public extension Pixar.HgiGLPtr
  {
    var device: Pixar.HgiGLDevice
    {
      pointee.device
    }

    var value: VtValue
    {
      pointee.getValue(self)
    }
  }
#endif /* canImport(HgiGL) */
