# simdLinux

This is a non-simd(!) implementation of the simd-library for reusing code on Linux.
In your swift source just replace:

```swift
import simd
```

with

```swift
#if os(macOS) || os(iOS) || os(watchOS) || is(tvOS)
    import simd
#else
    import simdLinux
#endif
```

The implementation is not 100% complete, but is a pretty good start.
simd_float/double/int/uint are implemented for 1/2/3/4/8/16.
simd_quaternion is present.
matrix-support is very limited.
