//
//  AddToDoController.m
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/02.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import "AddToDoController.h"
#import "ToDo.h"

@implementation AddToDoController

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.titleTextField ||
        textField == self.contentTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"DoneInput"]) {
        if (self.titleTextField.text.length > 0 ||
            self.contentTextField.text.length > 0) {
            ToDo *toDo = [[ToDo alloc] initWithTitle:self.titleTextField.text content:self.contentTextField.text];
            self.toDo = toDo;
        }
    }
}
@end
