# CompoundFileReader

Swift package to read compound file (Structured Storage File) content documented in [MS-CFB](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-cfb/53989ce4-7b05-4f8d-829b-d08d6148375b)

## Example Usage

Add the following line to your project's SwiftPM dependencies:
```swift
.package(url: "https://github.com/hughbe/CompoundFileReader", from: "1.0.0"),
```

```swift
import NK2Reader

let data = Data(contentsOfFile: "<path-to-file>.rwz")!
let file = try CompoundFile(data: data)
print(file.rootStorage)
```
