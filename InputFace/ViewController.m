//
//  ViewController.m
//  InputFace
//
//  Created by LPPZ-User02 on 2016/10/19.
//  Copyright © 2016年 LPPZ-User02. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpace;
@property (weak, nonatomic) IBOutlet UITextField *messageText;
@property (nonatomic ,weak) UIButton *selectedBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChangeKeyboard:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
//    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
//    
//    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(tapDone:)];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    toolBar.items = @[item2,item1,item3];
//    
//    self.messageText.inputAccessoryView = toolBar;
    
}


- (void)tapDone:(UIBarButtonItem *)item{
    [self.view endEditing:YES];
}

- (void)didChangeKeyboard:(NSNotification *)note{
    //键盘显示\影藏完毕的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    //修改底部的约束
    self.bottomSpace.constant = [UIScreen mainScreen].bounds.size.height - frame.origin.y;
    //键盘弹起动画时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    //重新布局
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
//    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
//    
//    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
//    
//    [UIView animateWithDuration:duration animations:^{
//        CGFloat ty = [UIScreen mainScreen].bounds.size.height - rect.origin.y;
//        self.view.transform = CGAffineTransformMakeTranslation(0, -ty);
//    }];
}
- (IBAction)changeClick:(UIButton *)button {

    button.selected = !button.selected;
    
    UIView *inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 216)];
    inputView.backgroundColor = [UIColor redColor];
    
    if (button.selected) {
        self.messageText.inputView = inputView;
        [self.messageText reloadInputViews];
    }else{
        self.messageText.inputView = nil;
        [self.messageText reloadInputViews];
    }
    
    if (![self.messageText isFirstResponder])
    {
        [self.messageText becomeFirstResponder];
    }

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
