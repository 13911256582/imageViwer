//
//  ViewController.m
//  imageViwer
//
//  Created by ShaoLing on 4/26/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *iv;
@property (strong,nonatomic) UIImage *image;

@end

@implementation ViewController


- (void)setiv:(UIImageView *)imageView{
    _iv = imageView;
}

- (void)setupScrollView:(UIImage *)image{
    

    if(!image){
        NSLog(@"load image error");
    }
    
    self.iv = [[UIImageView alloc] initWithImage:image];
    
    [self.scrollView addSubview:self.iv];
    self.scrollView.contentSize = self.iv.bounds.size;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 2.0;
    
}


- (void)displayImage:(UIImage *)image{
    if (!_image) {
        _image = nil;
    }
    _image = image;
    
    [self setupScrollView:self.image];
    
}

- (void)loadImageWithURL:(NSString *)URL
{
    NSURL *url = [NSURL URLWithString:URL];

    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    if (!_image) {
        _image = nil;
    }
    
    _image = [[UIImage alloc] initWithData:imageData];
}


- (void)viewImageWithURL:(NSString *)URL
{
    
   [self loadImageWithURL:URL];
    
    if (!self.image){
        NSLog(@"load image from URL failed");
    }
    
    [self setupScrollView:self.image];
    
}
    
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)sender{
    return self.iv;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog (@"viewDidLoad");
    
    [self setupScrollView:self.image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
