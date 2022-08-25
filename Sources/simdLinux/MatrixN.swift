//
//  File.swift
//  
//
//  Created by Jochen Kiemes on 25.08.22.
//

import Foundation

import simd

public struct simd_matrix: Codable, Hashable {
    public var c1: simd_double2
    public var c2: simd_double2

    public init(_ c1: simd_double2, _ c2: simd_double2) {
        self.c1 = c1
        self.c2 = c2
    }
}

struct MatrixN<R,C,T> where R: SIMD, C:SIMD {
    public typealias Scalar = T

    var rows: [R]

    init(diagonal: R) {
        rows = []
    }
    init(diagonal: C) {
        rows = []
    }
    init(columns: [C]) {
        rows = []
    }
    init(rows: [R]) {
        self.rows = rows
    }
}
