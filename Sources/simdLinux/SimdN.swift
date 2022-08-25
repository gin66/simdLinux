//
//  File.swift
//
//
//  Created by Jochen Kiemes on 25.08.22.
//

import Foundation

public protocol SIMD {
    associatedtype Scalar

    var components: [Scalar] { get set }

    init(_ vector: [Scalar])
}

struct SIMDn<T>: Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Hashable, T:Comparable {
    public typealias Scalar = T

    let length: Int
    var vector: [T]

    var components: [Scalar] {
        get { return vector }
        set(newVector) { vector = newVector }
    }

    init(_ vector: [T]) {
        length = vector.count
        self.vector = vector
    }
}

extension SIMDn: Equatable {
    static func == (left: Self, right: Self) -> Bool {
        for i in 0..<left.length {
            if left.vector[i] != right.vector[i] {
                return false
            }
        }
        return true
    }
}

extension SIMDn where T: FloatingPoint {
    static func + (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 + $1 })
    }

    static func + (left: Self, right: T) -> Self {
        return Self(left.vector.map { $0 + right })
    }

    static func - (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 - $1 })
    }

    static func - (left: Self, right: T) -> Self {
        return Self(left.vector.map { $0 - right })
    }

    static prefix func - (vector: Self) -> Self {
        return Self(vector.vector.map { -$0 })
    }

    static func * (left: Self, right: Self) -> Self {
        return Self(zip(left.vector, right.vector).map { $0 * $1 })
    }

    static func * (left: Self, right: T) -> Self {
        return Self(left.vector.map { $0 * right })
    }

    static func * (left: T, right: Self) -> Self {
        return Self(right.vector.map { $0 * left })
    }

    static func / (left: Self, right: T) -> Self {
        return Self(left.vector.map { $0 / right })
    }

    static func += (left: inout Self, right: Self) {
        for i in 0..<left.length {
            left.vector[i] += right.vector[i]
        }
    }

    static func -= (left: inout Self, right: Self) {
        for i in 0..<left.length {
            left.vector[i] -= right.vector[i]
        }
    }

    func min(_ other: Self) -> Self {
        return Self(zip(self.vector, other.vector).map { Swift.min($0, $1) })
    }

    func max(_ other: Self) -> Self {
        return Self(zip(self.vector, other.vector).map { Swift.max($0, $1) })
    }

    func dot(_ other: Self) -> T {
        var sum: T = 0
        for i in 0..<length {
            sum += vector[i] * other.vector[i]
        }
        return sum
    }

    func distance(_ other: Self) -> T {
        var sum: T = 0
        for i in 0..<length {
            let delta = vector[i] - other.vector[i]
            sum += delta * delta
        }
        return sum.squareRoot()
    }

    func simd_length() -> T {
        var sum: T = 0
        for i in 0..<length {
            let delta = vector[i]
            sum += delta * delta
        }
        return sum.squareRoot()
    }

    func normalize() -> Self {
        return self / self.simd_length()
    }

    func abs() -> Self {
        return Self(vector.map{$0})
    }
}
