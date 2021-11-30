//
//  TestUtil.swift
//  MiniSuperAppUITests
//
//  Created by 최제환 on 2021/11/30.
//

import Foundation

enum TestUtilError: Error {
    case fileNotFound
}

final class TestUtil {
    static func path(for fileName: String, in bundleClass: AnyClass) throws -> String {
        if let path = Bundle(for: bundleClass).path(forResource: fileName, ofType: nil) {
            return path
        } else {
            throw TestUtilError.fileNotFound
        }
    }
}
