//
//  ViewController.m
//  ReactiveCocoa框架
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

#import "ReactiveCocoa.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *texfField;
@property (weak, nonatomic) IBOutlet UILabel *label;

/** nss= */
@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 把文本框的内容展示到label
//    [_texfField.rac_textSignal subscribeNext:^(id x) {
//        _label.text = x;
//    }];

    // 给某个对象的某个属性绑定一个信号,只要产生信号,就会把信号的内容给对象的属性赋值
    // 给label的text属性绑定一个信号
    RAC(_label,text) = _texfField.rac_textSignal;
    
    // 观察某个对象某个属性
    [RACObserve(self, name) subscribeNext:^(id x) {
       
        NSLog(@"%@",x);
    }];
    
    // 创建元祖
//    RACTuple *tuple = [RACTuple tupleWithObjectsFromArray:@[@"123",@1]];
    // RACTuplePack:快速把一些数据包装成元组类
    RACTuple *tuple = RACTuplePack(@"123",@1);
    
    // 参数:需要解析生成出来变量名
    RACTupleUnpack(NSString *str,NSNumber *num) = tuple;
    
    NSLog(@"%@ %@",str,num);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    self.name = @"123";
//}



@end
