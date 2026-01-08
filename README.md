# CompoundFileReader

Swift package to read compound file (Structured Storage File) content documented in [MS-CFB](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cfb/).

## Example Usage

Add the following line to your project's SwiftPM dependencies:
```swift
.package(url: "https://github.com/hughbe/CompoundFileReader", from: "1.0.0"),
```

```swift
import CompoundFileReader

let data = Data(contentsOfFile: "<path-to-file>")!
let file = try CompoundFile(data: data)
print(file.rootStorage)
```
