/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "InspectorBlock.h"
#import "CCBGlobals.h"
#import "CCNode+NodeInfo.h"
#import "AppDelegate.h"

@implementation InspectorBlock

@dynamic selector;
- (void) setSelector:(NSString *)selector
{
    [[AppDelegate appDelegate] saveUndoStateWillChangeProperty:@"selector"];
    
    if (!selector) selector = @"";
    [selection setExtraProp:selector forKey:propertyName];
}

- (NSString*) selector
{
    NSString* sel = [selection extraPropForKey:propertyName];
    if (!sel) sel = @"";
    return sel;
}

- (void) setTarget:(int)target
{
    [[AppDelegate appDelegate] saveUndoStateWillChangeProperty:[NSString stringWithFormat:@"%@Target", propertyName]];
    [selection setExtraProp:[NSNumber numberWithInt:target] forKey:[NSString stringWithFormat:@"%@Target", propertyName]];
}

- (int) target
{
    return [[selection extraPropForKey:[NSString stringWithFormat:@"%@Target", propertyName]] intValue];
}

@end
