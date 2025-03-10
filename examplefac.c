#include <stdio.h>
#include "tinyexpr.h"

int main(int argc, char *argv[]) {
    double r;
    const char *expression = "5! + (3 ^ 2)! - 4!";
    r = te_interp(expression, 0);
    printf("The expression:\n\t%s\nevaluates to:\n\t%f\n", expression, r);

    const char *expression2 = "2 * 5! / 3";
    r = te_interp(expression2, 0);
    printf("The expression:\n\t%s\nevaluates to:\n\t%f\n", expression2, r);

    return 0;
}
