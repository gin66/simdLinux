import Foundation

public func simd_dot<T: FloatingPoint>(_ left: SIMD2<T>, _ right: SIMD2<T>) -> T {
    return left.dot(right)
}
public func simd_dot<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> T {
    return left.dot(right)
}
public func simd_dot<T: FloatingPoint>(_ left: SIMD4<T>, _ right: SIMD4<T>) -> T {
    return left.dot(right)
}

public func simd_distance<T: FloatingPoint>(_ left: SIMD2<T>, _ right: SIMD2<T>) -> T {
    return left.distance(right)
}
public func simd_distance<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> T {
    return left.distance(right)
}
public func simd_distance<T: FloatingPoint>(_ left: SIMD4<T>, _ right: SIMD4<T>) -> T {
    return left.distance(right)
}

public func simd_max<T: FloatingPoint>(_ left: SIMD2<T>, _ right: SIMD2<T>) -> SIMD2<T> {
    return left.max(right)
}
public func simd_max<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> SIMD3<T> {
    return left.max(right)
}
public func simd_max<T: FloatingPoint>(_ left: SIMD4<T>, _ right: SIMD4<T>) -> SIMD4<T> {
    return left.max(right)
}

public func simd_min<T: FloatingPoint>(_ left: SIMD2<T>, _ right: SIMD2<T>) -> SIMD2<T> {
    return left.min(right)
}
public func simd_min<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> SIMD3<T> {
    return left.min(right)
}
public func simd_min<T: FloatingPoint>(_ left: SIMD4<T>, _ right: SIMD4<T>) -> SIMD4<T> {
    return left.min(right)
}

public func simd_length<T: FloatingPoint>(_ vector: SIMD2<T>) -> T {
    return vector.length()
}
public func simd_length<T: FloatingPoint>(_ vector:  SIMD3<T>) -> T {
    return vector.length()
}
public func simd_length<T: FloatingPoint>(_ vector: SIMD4<T>) -> T {
    return vector.length()
}

public func simd_normalize<T: FloatingPoint>(_ vector: SIMD2<T>) -> SIMD2<T> {
    return vector.normalize()
}
public func simd_normalize<T: FloatingPoint>(_ vector:  SIMD3<T>) -> SIMD3<T> {
    return vector.normalize()
}
public func simd_normalize<T: FloatingPoint>(_ vector: SIMD4<T>) -> SIMD4<T> {
    return vector.normalize()
}

public func abs<T: FloatingPoint>(_ vector: SIMD2<T>) -> SIMD2<T> {
    return vector.abs()
}
public func abs<T: FloatingPoint>(_ vector:  SIMD3<T>) -> SIMD3<T> {
    return vector.abs()
}
public func abs<T: FloatingPoint>(_ vector: SIMD4<T>) -> SIMD4<T> {
    return vector.abs()
}
