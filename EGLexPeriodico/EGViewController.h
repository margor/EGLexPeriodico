//
//  EGViewController.h
//  EGLexPeriodico
//
//  Created by Esther Gordo Ramos on 20/11/13.
//  Copyright (c) 2013 Esther Gordo Ramos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *nacionalButton;
@property (weak, nonatomic) IBOutlet UIButton *localButton;
@property (weak, nonatomic) IBOutlet UIButton *deportesButton;
@property (weak, nonatomic) IBOutlet UIButton *culturaButton;
@property (weak, nonatomic) IBOutlet UIButton *saludButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIView *fondoMenuButtonsView;

@property (weak, nonatomic) IBOutlet UIView *fondoMenuView;

- (IBAction)pulsarMenuItemActionButton:(id)sender;
- (IBAction)pulsarMenuActionButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *tituloPeriodicoLabel;

- (IBAction)abrirEnlaceEnNavegador:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *fuenteEnlaceLabel;

- (IBAction)nacionalPulsarBoton:(id)sender;
- (IBAction)localPulsarBoton:(id)sender;
- (IBAction)deportesPulsarBoton:(id)sender;
- (IBAction)culturaPulsarBoton:(id)sender;
- (IBAction)saludPulsarBoton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *tituloNoticiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorNoticiaLabel;
@property (weak, nonatomic) IBOutlet UITextView *contenidoNoticiaTextView;

@end
