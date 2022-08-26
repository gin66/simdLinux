import Foundation

public protocol SIMD {
    associatedtype Scalar: Comparable,AdditiveArithmetic, Numeric, Hashable, FloatingPoint

    var vector: [Scalar] { get set }
    var scalarCount: Int { get }

    subscript(index:Int) -> Scalar { get set }

    init(_ vector: [Scalar])
}

public extension SIMD {
    subscript(index:Int) -> Scalar {
        get {
            return vector[index]
        }
        set(newElm) {
            vector[index] = newElm
        }
    }

    static func == (left: Self, right: Self) -> Bool {
        for i in 0..<left.scalarCount {
            if left[i] != right[i] {
                return false
            }
        }
        return true
    }

    static func + (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 + $1 })
    }

    static func + (left: Self, right: Scalar) -> Self {
        return Self(left.vector.map { $0 + right })
    }

    static func - (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 - $1 })
    }

    static func - (left: Self, right: Scalar) -> Self {
        return Self(left.vector.map { $0 - right })
    }

    static prefix func - (vector: Self) -> Self {
        return Self(vector.vector.map { -$0 })
    }

    static func * (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 * $1 })
    }

    static func * (left: Self, right: Scalar) -> Self {
        return Self(left.vector.map { $0 * right })
    }

    static func * (left: Scalar, right: Self) -> Self {
        return Self(right.vector.map { $0 * left })
    }

    static func / (left: Self, right: Scalar) -> Self {
        return Self(left.vector.map { $0 / right })
    }

    static func += (left: inout Self, right: Self) {
        for i in 0..<left.scalarCount {
            left.vector[i] += right.vector[i]
        }
    }

    static func -= (left: inout Self, right: Self) {
        for i in 0..<left.scalarCount {
            left.vector[i] -= right.vector[i]
        }
    }

    func min(_ other: Self) -> Self {
        return Self(zip(self.vector, other.vector).map { Swift.min($0, $1) })
    }

    func max(_ other: Self) -> Self {
        return Self(zip(self.vector, other.vector).map { Swift.max($0, $1) })
    }

    func dot(_ other: Self) -> Scalar {
        var sum: Scalar = 0
        for i in 0..<scalarCount {
            sum += vector[i] * other.vector[i]
        }
        return sum
    }

    func distance(_ other: Self) -> Scalar {
        var sum: Scalar = 0
        for i in 0..<scalarCount {
            let delta = vector[i] - other.vector[i]
            sum += delta * delta
        }
        return sum.squareRoot()
    }

    func length() -> Scalar {
        var sum: Scalar = 0
        for i in 0..<scalarCount {
            let delta = vector[i]
            sum += delta * delta
        }
        return sum.squareRoot()
    }

    func normalize() -> Self {
        return self / self.length()
    }

    func abs() -> Self {
        return Self(vector.map{$0})
    }
}
