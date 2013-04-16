UIImage-Symmetric
=================

UIImage category for images assets that are symmetric.

Remember to slice your image to half ( vertically or horizontally).

Usage
------

```objc
UIImage *image = [UIImage symmetricImageNamed:@"sym_half.png" horizontalSplit:NO]; // Vertical sliced

UIImage *image2 = [UIImage symmetricImageNamed:@"sym_half.png" horizontalSplit:YES]; // Horizontal sliced
```