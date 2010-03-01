/*
 * AppController.j
 * capp
 *
 * Created by You on February 18, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@import "AppController.j"
@import "MultiLogger.j"

function main(args, namedArgs)
{
    CPLogRegister(MultiLogger(CPLogConsole));
    CPApplicationMain(args, namedArgs);
}
