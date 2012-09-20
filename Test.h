/*
tests for some functions
*/
#include "CImg.h"

#include "MinMax.h"

#include <time.h>

using namespace std;
using namespace cimg_library;

template<typename T>
CImg<T> test_MinColor(CImg<T> &source) {
	CImg<T> output = MinColor(source);
	(source, output).display("Original | MinColor");
	return output;
}

template<typename T>
CImg<T> test_MidColor(CImg<T> &source) {
	CImg<T> output = MidColor(source);
	(source, output).display("Original | MidColor");
	return output;
}

template<typename T>
CImg<T> test_MaxColor(CImg<T> &source) {
	CImg<T> output = MaxColor(source);
	(source, output).display("Original | MaxColor");
	return output;
}

template<typename T>
CImg<T> test_MinMax1(CImg<T> &source) {
	CImg<T> output = MinMax1(source);
	(source, output).display("Original | MinMax1");
	return output;
}

template<typename T>
CImg<T> test_MinMax3(CImg<T> &source) {
	CImg<T> output = MinMax3(source);
	(source, output).display("Original | MinMax3");
	return output;
}

/* good for speed testing in gui */
template<typename T>
void test_All_display(CImg<T> &source) {
	(source, MinColor(source), MidColor(source), MaxColor(source), MinMax1(source), MinMax3(source)).display("Original | MinColor | MidColor | MaxColor | MinMax1 | MinMax3");
}

/*
generic speed test function that takes 3 params
1) pointer to a function you want to run
2) source image you want to use
3) number of iterations to run it for
the function simply displays how long it takes to run (*func) on source, num_itr times
the declaration looks so horrible, sorry!
*/
template<typename T>
void test_speed( CImg<T>(*func)(CImg<T> &), CImg<T> &source, int num_itr ) {
	time_t start, end;
	time(&start);
	for(int i=0; i<num_itr; i++) {
		(*func)(source);
	}
	time(&end);
	printf("Time elapsed: %.2lf \n", difftime(end, start));
	return;
}