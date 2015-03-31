//
//  JKBarView.m
//  Pods
//
//  Created by Camvy Films on 2015-03-31.
//
//

#import "JKBarView.h"

@implementation JKBarView

- (instancetype)init
{
  self = [super init];
  if(!self){
    return nil;
  }
  
  self.backgroundColor = [UIColor clearColor];
  self.color = [UIColor whiteColor];
  
  return self;
}


- (void)drawRect:(CGRect)rect
{
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  CGContextSetFillColorWithColor(ctx, [self.backgroundColor CGColor]);
  CGContextFillRect(ctx, rect);
  
  rect = CGRectInset(rect, .5, .5);
  
  CGContextSetStrokeColorWithColor(ctx, [self.color CGColor]);
  CGContextSetFillColorWithColor(ctx, [self.color CGColor]);
  
  CGContextAddEllipseInRect(ctx, rect);
  CGContextFillEllipseInRect(ctx, rect);
  
  CGContextFillPath(ctx);
}

-(void)layoutSubviews{
  //TODO: draw a mask bar on top of a filled circle.
  [super layoutSubviews];
  [self layoutMask];
}

-(void)layoutMask{
  CGFloat barVerticalPositionRatio = 0.75;
  CGFloat barHeightRatio = 0.05;
  CGFloat barWidthRatio = 0.6;
  CGFloat boundSize = self.bounds.size.width;
  UIBezierPath *path =
  [UIBezierPath
   bezierPathWithRoundedRect:
   CGRectMake(boundSize*(1-barWidthRatio)*0.51, boundSize*barVerticalPositionRatio, boundSize*barWidthRatio, boundSize*barHeightRatio)
   byRoundingCorners:UIRectCornerBottomRight
   cornerRadii:CGSizeMake(0, 0)];
  
  [self subviewMaskLayer].path = path.CGPath;
}

- (CAShapeLayer *)subviewMaskLayer {
  CAShapeLayer *mask = (CAShapeLayer *)self.layer.mask;
  if (mask == nil) {
    mask = [CAShapeLayer layer];
    self.layer.mask = mask;
  }
  return mask;
}


- (void)setColor:(UIColor *)color
{
  self->_color = color;
  
  [self setNeedsDisplay];
}
@end
