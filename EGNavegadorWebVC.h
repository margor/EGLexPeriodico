//
//  EGNavegadorWebVC.h
//  EGLexPeriodico
//
//  Created by Esther Gordo Ramos on 20/11/13.
//  Copyright (c) 2013 Esther Gordo Ramos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGNavegadorWebVC : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *navegadorWebView;

@property (strong,nonatomic) NSURL *urlABuscar;
-(void)irAtras;
-(void)irAdelante;
@end
