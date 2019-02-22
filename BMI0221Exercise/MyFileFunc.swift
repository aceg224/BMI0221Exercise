//
//  MyFileFunc.swift
//  BMI0221Exercise
//
//  Created by min-chia on 2019/2/21.
//  Copyright © 2019 min-chia. All rights reserved.
//

import Foundation
/* 將資料儲存在Documents目錄 */
func fileInDocuments(fileName: String) -> URL {
    let fileManager = FileManager()
    let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let fileUrl = urls.first!.appendingPathComponent(fileName)
    return fileUrl
}

/* 將資料儲存在temp目錄 */
func fileInTemp(fileName: String) -> URL {
    let url = URL(fileURLWithPath: NSTemporaryDirectory())
    let fileUrl = url.appendingPathComponent(fileName)
    return fileUrl
}

/* 將資料儲存在Caches目錄 */
func fileInCaches(fileName: String) -> URL {
    let fileManager = FileManager()
    let urls = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
    let fileUrl = urls.first!.appendingPathComponent(fileName)
    return fileUrl
}
