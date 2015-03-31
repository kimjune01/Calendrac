//
//  JKDumbbellView.m
//  Pods
//
//  Created by Camvy Films on 2015-03-31.
//
//

#import "JKDumbbellView.h"

@implementation JKDumbbellView

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
  CGRect bounds = [self bounds];
  [self.color set];
  CGContextRef context = UIGraphicsGetCurrentContext();
  UIImage *dumbbellImage = [UIImage imageNamed:@"icon_workout"];
  NSAssert(dumbbellImage != nil, @"Dumbbell image is nil!");
  CGContextClipToMask(context, bounds, [dumbbellImage CGImage]);
  CGContextFillRect(context, bounds);
  
//  CGContextRef ctx = UIGraphicsGetCurrentContext();
//  
//  CGContextSetFillColorWithColor(ctx, [self.backgroundColor CGColor]);
//  CGContextFillRect(ctx, rect);
//  
//  rect = CGRectInset(rect, .5, .5);
//  
//  CGContextSetStrokeColorWithColor(ctx, [self.color CGColor]);
//  CGContextSetFillColorWithColor(ctx, [self.color CGColor]);
//  
//  CGContextAddEllipseInRect(ctx, rect);
//  CGContextFillEllipseInRect(ctx, rect);
//  
//  CGContextFillPath(ctx);
}

- (void)setColor:(UIColor *)color
{
  self->_color = color;
  
  [self setNeedsDisplay];
}

@end
