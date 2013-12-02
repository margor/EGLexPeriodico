//
//  EGNavegadorWebVC.m
//  EGLexPeriodico
//
//  Created by Esther Gordo Ramos on 20/11/13.
//  Copyright (c) 2013 Esther Gordo Ramos. All rights reserved.
//

#import "EGNavegadorWebVC.h"

@interface EGNavegadorWebVC ()

@end

@implementation EGNavegadorWebVC
@synthesize urlABuscar,navegadorWebView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];

    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:urlABuscar];
    [navegadorWebView loadRequest:urlRequest];
    
    //UIView *adelanteButtonView = [[UIView alloc]init];
    //    adelanteButtonView addSubview:adelanteWebViewButton

    
    
    CGPoint posicionAdelanteButton = CGPointMake(CGRectGetMaxX(self.navigationController.navigationBar.bounds)-40, CGRectGetMinY(self.navigationController.navigationBar.bounds)+5);
    UIButton *adelanteWebViewButton = [[UIButton alloc]initWithFrame:CGRectMake(posicionAdelanteButton.x, posicionAdelanteButton.y, 32, 32)];
    UIButton *atrasWebViewButton =[[UIButton alloc]initWithFrame:CGRectMake(posicionAdelanteButton.x-40, posicionAdelanteButton.y, 32, 32)];

    [adelanteWebViewButton setImage:[UIImage imageNamed:@"arrow2.png"] forState:UIControlStateNormal];
    [atrasWebViewButton setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];

    
    [atrasWebViewButton addTarget:self
                           action:@selector(irAtras:)
                 forControlEvents:UIControlEventTouchUpInside];
    [adelanteWebViewButton addTarget:self
                           action:@selector(irAdelante:)
                 forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar addSubview:adelanteWebViewButton];
    [self.navigationController.navigationBar addSubview:atrasWebViewButton];
    
}

-(void)irAtras:(UIButton*)button
{
    [navegadorWebView goBack];
    NSLog(@"Atras");
}

-(void)irAdelante:(UIButton*)button
{
    [navegadorWebView goForward];
    NSLog(@"Adelante");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
