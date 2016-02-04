//
//  ViewController.m
//  PointStar
//
//  Created by baozun on 15/12/17.
//  Copyright (c) 2015年 baozun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *_allStar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _allStar = [[NSMutableArray alloc]initWithCapacity:0];
    UIImageView *imageView;
    for (int i = 0; i < 5; i++) {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_star_white"]];
        imageView.frame = CGRectMake(_myView.bounds.origin.x+((i+1)*24), _myView.bounds.origin.y, 24, 24);
        [_myView addSubview:imageView];
        [_allStar addObject:imageView];
    }
}
#pragma mark - 点击的坐标
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:_myView];
    UIImageView *im ;
    for(int i = 0;i < 5 ; i++){
        im = _allStar[i];
        NSLog(@"_all[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint.x > 0)&&(touchPoint.x < 144)&&(touchPoint.y > 0)&&(touchPoint.y < 24)) {
            NSString *myscore = [NSString stringWithFormat:@"分数为：%i",((int)touchPoint.x)/24];
            _score.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint.x) {
                im.image =[UIImage imageNamed:@"button_star_white"];
            }else{
                im.image =[UIImage imageNamed:@"button_star_red"];
            }
        }
    }
}
#pragma mark - 滑动的坐标
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:_myView];
    UIImageView *im ;
    for(int i = 0;i < 5 ; i++){
        im = _allStar[i];
        NSLog(@"_all[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint.x > 0)&&(touchPoint.x < 144)&&(touchPoint.y > 0)&&(touchPoint.y < 24)) {
            NSString *myscore = [NSString stringWithFormat:@"分数为：%i",((int)touchPoint.x)/24];
            _score.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint.x) {
                im.image =[UIImage imageNamed:@"button_star_white"];
            }else{
                im.image =[UIImage imageNamed:@"button_star_red"];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
