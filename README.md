# CompoundFileReader

Swift package to read compound file (Structured Storage File) content documented in [MS-CFB](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-cfb/53989ce4-7b05-4f8d-829b-d08d6148375b)

## Example
```swift
let data = Data(contentsOfFile: "<path-to-file>.rwz")!
let file = try CompoundFile(data: data)
print(file.root)
```
