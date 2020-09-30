// Aeolus
// Copyright (c) ajaidan0 2020

// Imports UITableView for ease of access
#import <UIKit/UITableView.h>

// Hook UITableView
%hook UITableView

- (void)setSeparatorStyle:(UITableViewCellSeparatorStyle)style {   
    // Override the separator style to always be UITableViewCellSeparatorStyleNone. 
    %orig(UITableViewCellSeparatorStyleNone);
}

%end

%ctor {
    /* 
     * Credits to Nepeta for process exclusion code
     * I do this because on some devices, there is a crash when you use 3D touch on a notification with this tweak installed.
    */

    // Check process and if process is on blacklist, return and don't run the tweak
    NSString *processName = [NSProcessInfo processInfo].processName;
    if ([processName isEqualToString:@"SpringBoard"]) {
    	return;
    } 
}
