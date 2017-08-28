//
//  ExampleOneLineCodeViewController.m
//  EasyBlueTooth
//
//  Created by nf on 2017/8/28.
//  Copyright © 2017年 chenSir. All rights reserved.
//

#import "ExampleOneLineCodeViewController.h"

@interface ExampleOneLineCodeViewController ()

@end

@implementation ExampleOneLineCodeViewController

- (void)dealloc
{
    [self.bleManager disconnectAllPeripheral];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"一行代码连接设备";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bleManager.bluetoothStateChanged = ^(EasyPeripheral *peripheral, bluetoothState state) {
        NSLog(@" ====== %ld ", state);
    } ;
    
    Byte bytes[8] = {0xfe,0x6a,0x72,0x5b,0x01,0x00,0x00,(0x6a+0x72+0x5b+0x01)%0x100};
    NSData *D = [[NSData alloc] initWithBytes:bytes length:8];
    [self.bleManager connectDeviceWithName:@"ClinkBlood" serviceUUID:@"0xFC00" notifyUUID:@"0xFCA1" wirteUUID:@"0xFCA0" writeData:D callback:^(NSData *data, NSError *error) {
        NSLog(@"%@ -- %@",data ,error );
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
