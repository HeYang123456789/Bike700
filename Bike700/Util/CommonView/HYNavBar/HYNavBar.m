//
//  HYNavBar.m
//  HYLibrary
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYNavBar.h"


#define HYTopBarHeight 64
//  默认导航高度
#define HYStaticNavDefaultHigh 44.0
#define HYStaticBottomPadding 3.0

/**
 * topBar 的高度，如果是ios7编译并且ios7运行高度为70.0f
 */
#define PCTopBarHeight 44.0f


#pragma mark - hy: 类别（写了一个方法，但是并没有写类别实现）
// hy: 相当于声明一个私有方法，现在其实可以不需要的
@interface HYNavBar (HYLibraryPrivate)

/**
 *	@brief	导航按钮大小
 *
 *	@param 	item 	数据项
 *
 *	@return	导航按钮大小
 */
- (CGSize)barButtonSize:(HYBarButtonItem *)item;

@end

@implementation HYNavBar
@synthesize leftBarButtonItem = _leftBarButtonItem;
@synthesize rightBarButtonItem = _rightBarButtonItem;
@synthesize topItem = _topItem;
@synthesize bgImg = _bgImg;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 默认背景颜色是透明的
        [self setBackgroundColor:[UIColor clearColor]];
        
        // self 添加 背景图片对象
        // 初始化设置背景UIImageView对象的背景颜色、内容填充模式、自动适配边距
        _bgView = [[UIImageView alloc] initWithFrame:GetZeroPointFrameAllInset(frame)];
        [_bgView setBackgroundColor:[UIColor clearColor]];
        [_bgView setContentMode:UIViewContentModeScaleToFill];
        [_bgView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [self addSubview:_bgView];
        
        // self 添加 左边按钮
        _leftBarButton = [[HYBarButton alloc] initWithFrame:CGRectZero];
        [self addSubview:_leftBarButton];
        
        // self 添加 右边按钮
        _rightBarButton = [[HYBarButton alloc] initWithFrame:CGRectZero];
        [self addSubview:_rightBarButton];
        
        // self 添加 顶部UIView，frame = Zero
        _topView = [[HYView alloc] initWithFrame:CGRectZero];
        [_topView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_topView];
        
        // self.topView 添加 topTitleView ，frame = Zero
        _topTitleView = [[UILabel alloc] initWithFrame:CGRectZero];
        [_topTitleView setBackgroundColor:[UIColor clearColor]];
#ifdef UITextAlignmentCenter
        [_topTitleView setTextAlignment:UITextAlignmentCenter];
#else
        [_topTitleView setTextAlignment:NSTextAlignmentCenter];
#endif
        // 设置宽度自适应
        [_topTitleView setAdjustsFontSizeToFitWidth:YES];
        [_topView addSubview:_topTitleView];
        
        //self 添加 tipImageView，frame = Zero
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_topImageView setContentMode:UIViewContentModeScaleAspectFit];
        [_topImageView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_topImageView];
    }
    return self;
}

#pragma mark - 在layoutSubViews方法中初始化所有的frame
- (void)layoutSubviews{
    [super layoutSubviews];
    // 设置背景视图
    CGRect frame = self.frame;
    CGRect bgFrame = CGRectMake(0,0,frame.size.width,frame.size.height);
    [_bgView setFrame:bgFrame];
    [_bgView setImage:self.bgImg];
    
    // 如果有左边
    if(self.leftBarButtonItem){
        [_leftBarButton setHidden:NO];
        //  设置左按钮视图
        CGSize leftSize = [self barButtonSize:self.leftBarButtonItem];

        if (_leftBarButtonItem.style == HYBarButtonItemStyleBack) {
            // hy:第二个宏定义要换掉
            leftSize =CGSizeMake(IOS7_OR_LATER?100:44, HYTopBarHeight-20);
            [_leftBarButton setImageInset:UIEdgeInsetsMake(20, 10, 5, 76)];
        }
        /*设置位置和大小*/
        [_leftBarButton setSize:leftSize];
        [_leftBarButton setBottom:self.bottom - HYStaticBottomPadding];
        [_leftBarButton setLeft:self.inset.left+3];
        [_leftBarButton setItem:self.leftBarButtonItem];
    }else{
        // 如果没有左边的按钮，就隐藏
        [_leftBarButton setHidden:YES];
    }
    
    if (self.rightBarButtonItem) {
        
        [_rightBarButton setHidden:NO];
        
        //  设置右按钮视图
        CGSize rightSize = [self barButtonSize:self.rightBarButtonItem];
        
        /*设置位置和大小*/
        [_rightBarButton setSize:rightSize];
        // 不管多大，都要先放在垂直中间的位置，然后距离右边10
        [_rightBarButton setBottom:self.bottom - HYStaticBottomPadding-10];// hy:我这里自己修改了
        [_rightBarButton setRight:self.width - self.inset.right-10];
        [_rightBarButton setItem:self.rightBarButtonItem];
    }
    else{
        [_rightBarButton setHidden:YES];
    }
    
    // 假如，根据实际需求，我们需要高度为100的导航条，那么这个134行代码就有必要了。
    CGFloat y = self.height - HYStaticNavDefaultHigh;
    CGFloat w = self.width/2;
    CGFloat h = self.height - y;
    [_topView setFrame:CGRectMake(0,y,w,h)];
    [_topView setCenterX:self.centerX];
    [_topTitleView setFrame:GetFrameInset(_topView.frame,self.inset)];
    [_topImageView setFrame:GetFrameInset(_topView.frame,self.inset)];
    //  设置标题视图
    if (self.topItem)
    {
        [self setLogoImgView:y];
    }
}

#pragma mark - Private
-(void)setLogoImgView:(CGFloat)heithOffset
{
    if (self.topItem.img && !self.topItem.title)
    {
        [_topImageView setFrame:CGRectMake(self.topItem.imgOffset, (self.height-self.topItem.img.size.height/2.f)/2,self.topItem.img.size.width/2.f, self.topItem.img.size.height/2.f)];
        [_topImageView setImage:self.topItem.img];
        [_topImageView setCenterY:self.centerY+heithOffset/2.0f];
        [_topImageView setCenterX:self.width/2];
//        [_topImageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    }else{
        [_topTitleView setFont:self.topItem.titleFont];
        [_topTitleView setText:self.topItem.title];
        [_topTitleView setTextColor:self.topItem.titleColor];
        [_topImageView removeFromSuperview];
    }
}

#pragma mark - hy : 根据BarButtonItem来返回导航条上的按钮的尺寸
/**
 *  被调用的场景
 *
 *  添加左边按钮，中间按钮，右边按钮都需要调用这个方法
 */
- (CGSize)barButtonSize:(HYBarButtonItem *)item{
    // 获取导航条尺寸的1/3为一个导航条按钮的最大尺寸
    //宽度为视图的的1/3（因为可能会有左\右\标题 3个按钮）
    CGSize maxSize = CGSizeMake(self.width / 3, self.height);
    
    #pragma mark  1、如果是普通按钮的数据模型
    if (item.style == HYBarButtonItemStyleBordered) {
        // 设置图片尺寸
        CGSize imgSize = CGSizeZero;
        // 如果有图片对象，就将图片的尺寸获取过来
        if (item.img) {
            imgSize = item.img.size;
        }
        // 设置文本标题尺寸
        CGSize titleSize = CGSizeZero;
        // 如果有文本对象，就将该字符串根据“titleFont,maxSize,换行样式”来获取字符串的尺寸
        if (item.title) {
// Line Break By Truncating Tail 通过删除尾巴来换行
// 因为分两种：UILineBreakByTruncatingTail和NSLineBreakByTruncatingTail
            //也就是说，有UI和NS两种
//#ifdef UILineBreakByTruncatingTail
//            titleSize = [item.title sizeWithFont:item.titleFont constrainedToSize:maxSize lineBreakMode:UILineBreakByTruncatingTail];
//#else
//            titleSize = [item.title sizeWithFont:item.titleFont constrainedToSize:maxSize lineBreakMode:NSLineBreakByTruncatingTail];
//#endif
            titleSize = [item.title getSizeWithFont:item.titleFont constrainedToSize:maxSize];
        }
        // 图片尺寸长宽各一半 和 文本 对比，返回最大的尺寸
        CGFloat w = MAX(imgSize.width/2, titleSize.width);
        CGFloat h = MAX(imgSize.height/2, titleSize.height);
        return CGSizeMake(w, h);
    }
    
    #pragma mark  2、如果是自定义按钮
    else if (item.style == HYBarButtonItemStyleCustom){
        // 获取自定义view的尺寸
        CGSize viewSize = item.customView.size;
        // 然后比较获取最小的
        CGFloat w = MIN(viewSize.width, maxSize.width);
        CGFloat h = MIN(viewSize.height, maxSize.height);
        return CGSizeMake(w, h);
    }
    #pragma mark  2、如果是返回按钮
    else if (item.style == HYBarButtonItemStyleBack){
        
        //hy: 如果是iOS7版本之前的的，我差点没看到那个感叹号！
        if (!IOS7_OR_LATER) {
            CGSize imgSize = CGSizeZero;
            if (item.img) {
                float w = item.img.size.width;
                float h = item.img.size.height;
                imgSize = CGSizeMake(w, h);
            }
            CGSize titleSize = CGSizeZero;
            if (item.title) {
//#ifdef UILineBreakByTruncatingTail
//                titleSize = [item.title sizeWithFont:item.titleFont constrainedToSize:maxSize lineBreakMode:UILineBreakByTruncatingTail];
//#else
//                titleSize = [item.title sizeWithFont:item.titleFont constrainedToSize:maxSize lineBreakMode:NSLineBreakByTruncatingTail];
//#endif
                titleSize = [item.title getSizeWithFont:item.titleFont constrainedToSize:maxSize];
            }
            CGFloat w = MAX(imgSize.width, titleSize.width);
            CGFloat h = MAX(imgSize.height, imgSize.height);
            return CGSizeMake(w, h);
        }else{
            
            //hy: ios7以后订制大小，就直接返回图片的size
            return CGSizeMake(item.img.size.width, item.img.size.height);
        }
    }else{
        //其他按钮接着这里设置
        return CGSizeZero;
    }
}

#pragma mark - hy: 懒加载 添加 三个按钮的模型数据
#pragma mark -hy : self = NavigationBar对象，下面就是设置各个按钮的模型数据
-(void)setTopItem:(HYNavItem *)nTopItem{

    _topItem =nTopItem;
    
    [self setNeedsLayout];
}

-(void)setLeftBarButtonItem:(HYBarButtonItem *)leftBarButtonItem{

    _leftBarButtonItem =leftBarButtonItem;
    
    [self setNeedsLayout];
}

-(void)setRightBarButtonItem:(HYBarButtonItem *)rightBarButtonItem{

    _rightBarButtonItem =rightBarButtonItem;
    
    [self setNeedsLayout];
}

@end
