//
//  File.swift
//  
//
//  Created by Jochen Kiemes on 25.08.22.
//

import Foundation

import simd

public func simd_mul(_ left: simd_float2x2, _ right: simd_float2) -> simd_float2 {
    return left * right
}
public func simd_mul(_ left: simd_double2x2, _ right: simd_double2) -> simd_double2 {
    return left * right
}
public func simd_mul(_ left: simd_float3x3, _ right: simd_float3) -> simd_float3 {
    return left * right
}
public func simd_mul(_ left: simd_double3x3, _ right: simd_double3) -> simd_double3 {
    return left * right
}

public typealias simd_float2x2 = MatrixNx2<Float>
public typealias simd_double2x2 = MatrixNx2<Double>
public typealias simd_float3x3 = MatrixNx3<Float>
public typealias simd_double3x3 = MatrixNx3<Double>

public func simd_matrix(_ c1: simd_float2, _ c2: simd_float2) -> simd_float2x2 {
    return simd_float2x2.make(columns: [c1,c2])
}
public func simd_matrix(_ c1: simd_double2, _ c2: simd_double2) -> simd_double2x2 {
    return simd_double2x2.make(columns: [c1,c2])
}

public struct MatrixNx2<T> where T: Codable, T: FloatingPoint {
    // N cols, 2 rows
    // N is defined by R.scalarCount

    public typealias Scalar = T

    var rows: [SIMD2<Scalar>]
    let rowCount = 2

    public init(rows: [SIMD2<Scalar>]) {
        if rows.count != rowCount {
            fatalError("Wront row count")
        }
        self.rows = rows
    }

    static func make(columns: [SIMD2<T>]) -> Self {
        if columns.count != 2 {
            fatalError("Wront row count")
        }
        let r0 = SIMD2(columns[0][0], columns[1][0])
        let r1 = SIMD2(columns[0][1], columns[1][1])
        let rows = [r0, r1 ]
        return Self(rows: rows)
    }

    public static func * (left: Self, right: SIMD2<Scalar>) -> SIMD2<Scalar> {
        return SIMD2(left.rows.map{ $0.dot(right)})
    }
}

public struct MatrixNx3<T> where T: Codable, T: FloatingPoint {
    // N cols, 3 rows
    // N is defined by R.scalarCount

    public typealias Scalar = T

    var rows: [SIMD3<Scalar>]
    let rowCount = 3
    
    public init(rows: [SIMD3<Scalar>]) {
        if rows.count != rowCount {
            fatalError("Wront row count")
        }
        self.rows = rows
    }

    static func make(columns: [SIMD3<T>]) -> Self {
        if columns.count != 3 {
            fatalError("Wront row count")
        }
        let r0 = SIMD3(columns[0][0], columns[1][0], columns[2][0])
        let r1 = SIMD3(columns[0][1], columns[1][1], columns[2][1])
        let r2 = SIMD3(columns[0][2], columns[1][2], columns[2][2])
        let rows = [r0, r1, r2 ]
        return Self(rows: rows)
    }

    public static func * (left: Self, right: SIMD3<Scalar>) -> SIMD3<Scalar> {
        return SIMD3(left.rows.map{ $0.dot(right)})
    }
}
