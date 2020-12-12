#import <Foundation/Foundation.h>

int main(int argc, char *argv[]) {
	@autoreleasepool {
		
		int w = 1920;
		int h = 1080;
		
		srandom(CFAbsoluteTimeGetCurrent());
		
		uint32 *src = new uint32[w*h];
		for(int k=0; k<w*h; k++) {
			src[k] = 0xFF000000|random()%0xFFFFFF;
		}

		uint32 *dst = new uint32[w*h];
		
		double sum = 0;
		
		int num = 0;
		
		for(int n=0; n<100; n++) {
			
			double then = CFAbsoluteTimeGetCurrent();
			for(int i=0; i<h; i++) {
				uint32 *p = src+i*w;
				uint32 *q = dst+i*w;
				for(int j=0; j<w; j++) {
					*p =  0xFF000000|random()%0xFFFFFF;
					*q++ = *p++;
				}
			}
			double diff = CFAbsoluteTimeGetCurrent()-then;
			NSLog(@"%f",diff);
			sum+=diff;
		}
		
		NSLog(@"rows = %f",sum/100.0);
		
		
		for(int n=0; n<100; n++) {
		
			double then = CFAbsoluteTimeGetCurrent();
			for(int j=0; j<w; j++) {
				uint32 *p = src+j;
				uint32 *q = dst+j;
				for(int i=0; i<h; i++) {
					*p = 0xFF000000|random()%0xFFFFFF;
					*q = *p;
					p+=w;
					q+=w;
				}
			}
			double diff = CFAbsoluteTimeGetCurrent()-then;
			NSLog(@"%f",diff);
			sum+=diff;
		}
		
		NSLog(@"cols = %f",sum/100.0);
		
		delete[] dst;
		delete[] src;
		
	}
}