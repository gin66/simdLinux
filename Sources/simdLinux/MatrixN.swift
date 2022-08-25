//
//  File.swift
//  
//
//  Created by Jochen Kiemes on 25.08.22.
//

import Foundation

import simd

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
