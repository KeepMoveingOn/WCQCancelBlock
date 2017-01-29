//
//  ViewController.m
//  WCQCancelBlock
//
//  Created by wcq on 17/1/26.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import "ViewController.h"
#import "WCQCancelBlock.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) NSBlockOperation *blockOperation;
@property (nonatomic, strong) NSInvocationOperation *invocationOperation;
@property (nonatomic, strong) WCQCancelBlock *cancelBlock;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.cancelButton];
}

#pragma mark - Event Mthods
- (void)startAction {
    
//    [self.blockOperation start];
//    [self.invocationOperation start];
    
    self.operationQueue;
}

- (void)cancelAction {
    
//    [self.blockOperation cancel];
//    [self.invocationOperation cancel];
    
    [self.operationQueue cancelAllOperations];
}

#pragma mark - Getter Methods
- (UIButton *)startButton {
    
    if (!_startButton) {
        
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.frame = CGRectMake(0, 0, 100, 30);
        _startButton.center = self.view.center;
        _startButton.backgroundColor = [UIColor orangeColor];
        [_startButton setTitle:@"start" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(0, 0, 100, 30);
        CGPoint centerPoint = self.view.center;
        centerPoint.y += 100;
        _cancelButton.center = centerPoint;
        _cancelButton.backgroundColor = [UIColor redColor];
        [_cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (NSBlockOperation *)blockOperation {
    
    if (!_blockOperation) {
        
        __weak __typeof(self) weakSelf = self;
        _blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            
            [weakSelf run:_blockOperation];
        }];
    }
    return _blockOperation;
}

- (NSInvocationOperation *)invocationOperation {
    
    if (!_invocationOperation) {
    
        _invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run:) object:nil];
    }
    return _invocationOperation;
}

- (WCQCancelBlock *)cancelBlock {
    
    if (!_cancelBlock) {
        
        _cancelBlock = [[WCQCancelBlock alloc] init];
    }
    return _cancelBlock;
}

- (NSOperationQueue *)operationQueue {
    
    if (!_operationQueue) {
        
        _operationQueue = [[NSOperationQueue alloc] init];
//        [_operationQueue addOperation:self.invocationOperation];
//        [_operationQueue addOperation:self.blockOperation];
        [_operationQueue addOperation:self.cancelBlock];
    }
    return _operationQueue;
}

- (void)run:(NSOperation *)operation {
    
    NSLog(@"currentThread == %@",[NSThread currentThread]);
    if (!operation) operation = self.invocationOperation;
//    if ([operation isCancelled]) return;
    for (NSInteger i = 0; i < 5; i++) {
        
//        if ([operation isCancelled]) return;
        sleep(1);
        NSLog(@"loop == %@",@(i + 1));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
