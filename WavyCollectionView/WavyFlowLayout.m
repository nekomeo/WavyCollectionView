//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Elle Ti on 2017-08-12.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout

- (void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100.0, 50.0);
    
    // Set minimum interim spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    // Need to copy attrs from super to avoid cached from mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attributes in superAttrs)
    {
        if (CGRectIntersectsRect(attributes.frame, rect) == YES)
        {
            float randomY = arc4random_uniform(self.collectionView.frame.size.height - attributes.frame.size.height);
            
            attributes.frame = CGRectMake(attributes.frame.origin.x, randomY, attributes.frame.size.width, attributes.frame.size.height);
            
            [newAttrs addObject:attributes];
        }
    }
    
    return newAttrs;
}

@end
