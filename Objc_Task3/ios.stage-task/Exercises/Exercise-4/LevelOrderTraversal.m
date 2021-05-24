#import "LevelOrderTraversal.h"

NSUInteger createLevelOrder(NSArray *tree, NSMutableArray *result, NSUInteger beginIndex, NSUInteger distance) {
    NSUInteger index = beginIndex;
    
    for (int direction = 0; direction <= 1 && index + 1 <= tree.count; direction++) {

        id nodeValue = tree[index++];
        if (![nodeValue isKindOfClass:NSNull.class]) {
            if (result.count <= distance) {
                NSMutableArray *newArray = [NSMutableArray new];
                [result addObject: newArray];
            }
            
            [result[distance] addObject: nodeValue];
            index = createLevelOrder(tree, result, index, distance + 1);
        }
    }
    return index;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
   NSMutableArray *result = [NSMutableArray new];
       
       if (tree.count == 0 || nil == tree) {
           return result;
       }
       else if (tree.count == 1) {
           if (![tree[0] isKindOfClass: NSNull.class]) {
               [result addObject: @[tree[0]]];
           }
           return result;
       }
       
       createLevelOrder(tree, result, 0, 0);
       return result;
}
